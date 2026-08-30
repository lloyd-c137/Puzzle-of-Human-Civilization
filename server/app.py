import hashlib
import hmac
import os
import secrets
from datetime import datetime, timezone
from pathlib import Path
from typing import Any
from urllib.parse import urlsplit

import psycopg
from fastapi import FastAPI, HTTPException, Request, Response, status
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel, Field, field_validator
from psycopg.rows import dict_row
from psycopg.types.json import Jsonb


DATABASE_URL = os.environ["DATABASE_URL"]
SITE_ROOT = Path(os.environ.get("SITE_ROOT", "/srv/site")).resolve()
RATE_LIMIT = 5
IP_HASH_SALT = os.environ.get("IP_HASH_SALT", "change-this-salt")
OWNER_TOKEN_SALT = os.environ.get("OWNER_TOKEN_SALT", IP_HASH_SALT)
ADMIN_PASSWORD_HASH = os.environ.get("ADMIN_PASSWORD_HASH", "")
ADMIN_SESSION_SECRET = os.environ.get("ADMIN_SESSION_SECRET", "")
ADMIN_SESSION_COOKIE = "learningjournal_admin"
ADMIN_SESSION_MAX_AGE = 8 * 60 * 60


def normalize_path(value: str) -> str:
    path = urlsplit(value).path or "/"
    if not path.startswith("/") or "\x00" in path or any(part == ".." for part in path.split("/")):
        raise ValueError("Invalid page path")
    return path


class CommentInput(BaseModel):
    page_path: str = Field(min_length=1, max_length=512)
    selected_text: str = Field(min_length=3, max_length=2000)
    anchor: dict[str, Any]
    author_name: str = Field(default="", max_length=80)
    body: str = Field(min_length=1, max_length=2000)
    client_id: str = Field(default="", max_length=128)
    website: str = Field(default="", max_length=200)

    @field_validator("page_path")
    @classmethod
    def validate_page_path(cls, value: str) -> str:
        return normalize_path(value)

    @field_validator("selected_text", "author_name", "body")
    @classmethod
    def trim_text(cls, value: str) -> str:
        return value.strip()

    @field_validator("client_id")
    @classmethod
    def trim_client_id(cls, value: str) -> str:
        return value.strip()


class CommentDeleteInput(BaseModel):
    client_id: str = Field(min_length=1, max_length=128)
    owner_token: str = Field(min_length=20, max_length=200)

    @field_validator("client_id", "owner_token")
    @classmethod
    def trim_delete_values(cls, value: str) -> str:
        return value.strip()


class AdminLoginInput(BaseModel):
    password: str = Field(min_length=1, max_length=256)


app = FastAPI(title="PHC Learning Journal Comments", docs_url=None, redoc_url=None)


def connection():
    return psycopg.connect(DATABASE_URL, row_factory=dict_row)


def init_database() -> None:
    with connection() as conn:
        conn.execute(
            """
            CREATE TABLE IF NOT EXISTS page_comments (
                id BIGSERIAL PRIMARY KEY,
                page_path TEXT NOT NULL,
                selected_text TEXT NOT NULL,
                anchor JSONB NOT NULL,
                author_name TEXT NOT NULL DEFAULT 'Anonymous',
                body TEXT NOT NULL,
                ip_hash TEXT NOT NULL,
                created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
                status TEXT NOT NULL DEFAULT 'visible'
                    CHECK (status IN ('visible', 'hidden'))
            )
            """
        )
        conn.execute(
            "CREATE INDEX IF NOT EXISTS page_comments_page_path_created_at_idx "
            "ON page_comments (page_path, created_at DESC)"
        )
        conn.execute(
            "ALTER TABLE page_comments ADD COLUMN IF NOT EXISTS owner_client_id TEXT"
        )
        conn.execute(
            "ALTER TABLE page_comments ADD COLUMN IF NOT EXISTS owner_token_hash TEXT"
        )


@app.on_event("startup")
def startup() -> None:
    init_database()


def public_comment(row: dict[str, Any]) -> dict[str, Any]:
    created = row["created_at"]
    if isinstance(created, datetime) and created.tzinfo is None:
        created = created.replace(tzinfo=timezone.utc)
    return {
        "id": row["id"],
        "page_path": row["page_path"],
        "selected_text": row["selected_text"],
        "anchor": row["anchor"],
        "author_name": row["author_name"] or "Anonymous",
        "body": row["body"],
        "created_at": created.isoformat() if isinstance(created, datetime) else str(created),
    }


def visitor_hash(request: Request) -> str:
    address = request.client.host if request.client else "unknown"
    return hashlib.sha256(f"{IP_HASH_SALT}:{address}".encode()).hexdigest()


def owner_token_hash(token: str) -> str:
    return hashlib.sha256(f"{OWNER_TOKEN_SALT}:{token}".encode()).hexdigest()


def password_matches(password: str) -> bool:
    """Verify a password stored as scrypt$N$r$p$salt_hex$hash_hex."""
    try:
        scheme, n_value, r_value, p_value, salt_hex, digest_hex = ADMIN_PASSWORD_HASH.split("$")
        if scheme != "scrypt":
            return False
        derived = hashlib.scrypt(
            password.encode(),
            salt=bytes.fromhex(salt_hex),
            n=int(n_value),
            r=int(r_value),
            p=int(p_value),
            dklen=len(bytes.fromhex(digest_hex)),
        )
        return hmac.compare_digest(derived.hex(), digest_hex)
    except (ValueError, TypeError, UnicodeError):
        return False


def admin_session_value() -> str:
    timestamp = str(int(datetime.now(timezone.utc).timestamp()))
    nonce = secrets.token_urlsafe(24)
    payload = f"{timestamp}.{nonce}"
    signature = hmac.new(
        ADMIN_SESSION_SECRET.encode(), payload.encode(), hashlib.sha256
    ).hexdigest()
    return f"{payload}.{signature}"


def is_admin_authenticated(request: Request) -> bool:
    if not ADMIN_SESSION_SECRET:
        return False
    value = request.cookies.get(ADMIN_SESSION_COOKIE, "")
    parts = value.split(".")
    if len(parts) != 3:
        return False
    timestamp, nonce, signature = parts
    if not nonce or not timestamp.isdigit():
        return False
    issued_at = int(timestamp)
    now = int(datetime.now(timezone.utc).timestamp())
    if issued_at > now + 60 or now - issued_at > ADMIN_SESSION_MAX_AGE:
        return False
    payload = f"{timestamp}.{nonce}"
    expected = hmac.new(
        ADMIN_SESSION_SECRET.encode(), payload.encode(), hashlib.sha256
    ).hexdigest()
    return hmac.compare_digest(signature, expected)


def require_admin(request: Request) -> None:
    if not is_admin_authenticated(request):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Administrator login required",
            headers={"WWW-Authenticate": "Bearer"},
        )


@app.get("/api/comments")
def get_comments(path: str = "/") -> dict[str, Any]:
    try:
        page_path = normalize_path(path)
    except ValueError as error:
        raise HTTPException(status_code=400, detail=str(error)) from error
    with connection() as conn:
        rows = conn.execute(
            "SELECT id, page_path, selected_text, anchor, author_name, body, created_at "
            "FROM page_comments WHERE page_path = %s AND status = 'visible' "
            "ORDER BY created_at ASC",
            (page_path,),
        ).fetchall()
    return {"comments": [public_comment(row) for row in rows]}


@app.post("/api/comments", status_code=status.HTTP_201_CREATED)
def create_comment(payload: CommentInput, request: Request) -> JSONResponse:
    if payload.website:
        return JSONResponse({"ok": True}, status_code=status.HTTP_201_CREATED)
    if not payload.anchor.get("selected_text"):
        raise HTTPException(status_code=422, detail="The selected passage is missing")
    visitor = visitor_hash(request)
    with connection() as conn:
        recent = conn.execute(
            "SELECT count(*) FROM page_comments "
            "WHERE ip_hash = %s AND created_at > now() - interval '60 seconds'",
            (visitor,),
        ).fetchone()["count"]
        if recent >= RATE_LIMIT:
            raise HTTPException(status_code=429, detail="Please wait before posting another comment")
        owner_token = secrets.token_urlsafe(32) if payload.client_id else ""
        row = conn.execute(
            "INSERT INTO page_comments "
            "(page_path, selected_text, anchor, author_name, body, ip_hash, "
            "owner_client_id, owner_token_hash) "
            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s) "
            "RETURNING id, page_path, selected_text, anchor, author_name, body, created_at",
            (
                payload.page_path,
                payload.selected_text,
                Jsonb(payload.anchor),
                payload.author_name or "Anonymous",
                payload.body,
                visitor,
                payload.client_id or None,
                owner_token_hash(owner_token) if owner_token else None,
            ),
        ).fetchone()
    return JSONResponse(
        {"comment": public_comment(row), "owner_token": owner_token},
        status_code=status.HTTP_201_CREATED,
    )


@app.delete("/api/comments/{comment_id}")
def delete_own_comment(comment_id: int, payload: CommentDeleteInput) -> dict[str, Any]:
    with connection() as conn:
        row = conn.execute(
            "DELETE FROM page_comments "
            "WHERE id = %s AND owner_client_id = %s AND owner_token_hash = %s "
            "RETURNING id",
            (comment_id, payload.client_id, owner_token_hash(payload.owner_token)),
        ).fetchone()
    if not row:
        raise HTTPException(status_code=404, detail="Comment not found or not owned by this browser")
    return {"ok": True, "id": row["id"]}


@app.post("/api/admin/session")
def admin_login(payload: AdminLoginInput, response: Response) -> dict[str, Any]:
    if not ADMIN_PASSWORD_HASH or not ADMIN_SESSION_SECRET:
        raise HTTPException(status_code=503, detail="Administrator access is not configured")
    if not password_matches(payload.password):
        raise HTTPException(status_code=401, detail="Incorrect administrator password")
    response.set_cookie(
        ADMIN_SESSION_COOKIE,
        admin_session_value(),
        max_age=ADMIN_SESSION_MAX_AGE,
        httponly=True,
        samesite="strict",
        secure=os.environ.get("ADMIN_COOKIE_SECURE", "0") == "1",
        path="/",
    )
    return {"authenticated": True}


@app.get("/api/admin/session")
def admin_session(request: Request) -> dict[str, Any]:
    return {"authenticated": is_admin_authenticated(request)}


@app.delete("/api/admin/session")
def admin_logout(response: Response) -> dict[str, Any]:
    response.delete_cookie(ADMIN_SESSION_COOKIE, path="/")
    return {"authenticated": False}


@app.get("/api/admin/comments")
def admin_comments(request: Request) -> dict[str, Any]:
    require_admin(request)
    with connection() as conn:
        rows = conn.execute(
            "SELECT id, page_path, selected_text, anchor, author_name, body, created_at, status "
            "FROM page_comments ORDER BY created_at DESC"
        ).fetchall()
    return {"comments": [
        {**public_comment(row), "status": row["status"]} for row in rows
    ]}


@app.post("/api/admin/comments/{comment_id}/delete")
@app.delete("/api/admin/comments/{comment_id}")
def admin_delete_comment(comment_id: int, request: Request) -> dict[str, Any]:
    require_admin(request)
    with connection() as conn:
        row = conn.execute(
            "DELETE FROM page_comments WHERE id = %s RETURNING id", (comment_id,)
        ).fetchone()
    if not row:
        raise HTTPException(status_code=404, detail="Comment not found")
    return {"ok": True, "id": row["id"]}


if not SITE_ROOT.is_dir():
    raise RuntimeError(f"Static site directory does not exist: {SITE_ROOT}")

app.mount("/", StaticFiles(directory=SITE_ROOT, html=True), name="site")
