#!/usr/bin/env bash

set -euo pipefail
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/usr/local/bin"

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

production_origin="${JOURNAL_SITE_ORIGIN:-https://learning.lloydev.site}"
render_origin="${PHC_RENDER_ORIGIN:-https://lloyd-c137.github.io/Puzzle-of-Human-Civilization}"
ssh_host="${JOURNAL_SITE_SSH_HOST:-root@46.62.212.36}"
ssh_port="${JOURNAL_SITE_SSH_PORT:-2222}"
container_name="${JOURNAL_SITE_CONTAINER:-learningjournal-static}"
github_repo="${PHC_GITHUB_REPO:-lloyd-c137/Puzzle-of-Human-Civilization}"
github_workflow="${PHC_PAGES_WORKFLOW:-pages.yml}"

tmp_dir="$(mktemp -d "${TMPDIR:-/tmp}/learning-journal-site.XXXXXX")"
trap 'rm -rf "$tmp_dir"' EXIT

fail() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 1
}

usage() {
  cat <<'EOF'
Usage:
  bash scripts/sync-journal-to-site.sh --audit
  bash scripts/sync-journal-to-site.sh "path/to/Journal.md" [extra-asset ...]
EOF
}

front_matter_value() {
  local file="$1"
  local key="$2"
  awk -v key="$key" '
    NR == 1 && $0 == "---" { front_matter = 1; next }
    front_matter && $0 == "---" { exit }
    front_matter && index($0, key ":") == 1 {
      sub("^[^:]+:[[:space:]]*", "")
      print
      exit
    }
  ' "$file"
}

is_active_journal() {
  local file="$1"
  [[ "$(sed -n '1p' "$file")" == "---" ]] || return 1
  [[ -n "$(front_matter_value "$file" journal_type)" ]]
}

validate_metadata() {
  local file="$1"
  local quiet="${2:-0}"
  local errors=0
  local key value journal_type platform permalink section subject scope

  for key in layout title permalink section summary journal_type learning_platform subject; do
    value="$(front_matter_value "$file" "$key")"
    if [[ -z "$value" ]]; then
      ((errors += 1))
      [[ "$quiet" == 1 ]] || printf 'ERROR: %s: missing front-matter %s\n' "$file" "$key" >&2
    fi
  done

  journal_type="$(front_matter_value "$file" journal_type)"
  platform="$(front_matter_value "$file" learning_platform)"
  permalink="$(front_matter_value "$file" permalink)"
  section="$(front_matter_value "$file" section)"
  subject="$(front_matter_value "$file" subject)"
  scope="$(front_matter_value "$file" journal_scope)"

  case "$journal_type" in
    learning_journal)
      [[ "$platform" == independent ]] || {
        ((errors += 1))
        [[ "$quiet" == 1 ]] || printf 'ERROR: %s: learning_journal must use learning_platform: independent\n' "$file" >&2
      }
      ;;
    unit_learning_journal)
      [[ "$platform" == khan-academy ]] || {
        ((errors += 1))
        [[ "$quiet" == 1 ]] || printf 'ERROR: %s: unit_learning_journal must use learning_platform: khan-academy\n' "$file" >&2
      }
      [[ -n "$(front_matter_value "$file" unit)" ]] || {
        ((errors += 1))
        [[ "$quiet" == 1 ]] || printf 'ERROR: %s: unit_learning_journal is missing front-matter unit\n' "$file" >&2
      }
      ;;
    *)
      ((errors += 1))
      [[ "$quiet" == 1 ]] || printf 'ERROR: %s: unsupported journal_type: %s\n' "$file" "${journal_type:-<missing>}" >&2
      ;;
  esac

  if [[ -n "$section" && ! "$section" =~ ^(Mathematics|Biology|Chemistry|Physics)$ ]]; then
    ((errors += 1))
    [[ "$quiet" == 1 ]] || printf 'ERROR: %s: invalid section: %s\n' "$file" "$section" >&2
  fi
  if [[ -n "$subject" && "$subject" != "$section" ]]; then
    ((errors += 1))
    [[ "$quiet" == 1 ]] || printf 'ERROR: %s: subject must match section\n' "$file" >&2
  fi
  if [[ -n "$permalink" && ! "$permalink" =~ ^/[A-Za-z0-9._~/-]+/$ ]]; then
    ((errors += 1))
    [[ "$quiet" == 1 ]] || printf 'ERROR: %s: permalink must be an absolute, trailing-slash URL path without spaces\n' "$file" >&2
  fi
  if [[ "$scope" == overview && "$journal_type" != learning_journal ]]; then
    ((errors += 1))
    [[ "$quiet" == 1 ]] || printf 'ERROR: %s: overview must use journal_type: learning_journal\n' "$file" >&2
  fi

  ((errors == 0))
}

journal_inventory() {
  find . \
    -path './.git' -prune -o \
    -path './tmp' -prune -o \
    -type f -name '*.md' -print |
    while IFS= read -r file; do
      if is_active_journal "$file"; then
        printf '%s\n' "${file#./}"
      fi
    done |
    LC_ALL=C sort
}

audit_journals() {
  local inventory="$tmp_dir/journals.txt"
  local routes="$tmp_dir/routes.txt"
  local file permalink code state
  local total=0 live=0 missing=0 invalid=0

  journal_inventory > "$inventory"
  : > "$routes"

  printf '%-10s %-4s %s\n' STATE HTTP JOURNAL
  while IFS= read -r file; do
    ((total += 1))
    if ! validate_metadata "$file" 1; then
      printf '%-10s %-4s %s\n' INVALID - "$file"
      validate_metadata "$file" 0 || true
      ((invalid += 1))
      continue
    fi

    permalink="$(front_matter_value "$file" permalink)"
    printf '%s\t%s\n' "$permalink" "$file" >> "$routes"
    code="$(curl -L -sS -o /dev/null -w '%{http_code}' --connect-timeout 5 --max-time 20 "${production_origin%/}${permalink}" || true)"
    if [[ "$code" == 200 ]]; then
      state=LIVE
      ((live += 1))
    else
      state=MISSING
      ((missing += 1))
    fi
    printf '%-10s %-4s %s -> %s\n' "$state" "${code:--}" "$file" "$permalink"
  done < "$inventory"

  if [[ -s "$routes" ]]; then
    duplicates="$(cut -f1 "$routes" | LC_ALL=C sort | uniq -d)"
    if [[ -n "$duplicates" ]]; then
      printf '\nDuplicate production permalinks:\n' >&2
      while IFS= read -r permalink; do
        awk -F '\t' -v route="$permalink" '$1 == route { print "  " $0 }' "$routes" >&2
        ((invalid += 1))
      done <<< "$duplicates"
    fi
  fi

  printf '\nAudit summary: %d Journal(s), %d live, %d missing/non-200, %d invalid metadata\n' \
    "$total" "$live" "$missing" "$invalid"
  ((missing == 0 && invalid == 0))
}

git_blob_matches_origin() {
  local file="$1"
  local local_hash remote_hash
  local_hash="$(git hash-object "$file")"
  remote_hash="$(git show "origin/main:$file" 2>/dev/null | git hash-object --stdin || true)"
  [[ -n "$remote_hash" && "$local_hash" == "$remote_hash" ]]
}

wait_for_render() {
  local expected_sha="$1"
  local json="$tmp_dir/pages-run.json"
  local run_state attempt

  for attempt in 1 2 3 4 5 6; do
    if curl -fsSL --connect-timeout 5 --max-time 20 \
      "https://api.github.com/repos/${github_repo}/actions/workflows/${github_workflow}/runs?branch=main&per_page=1" \
      -o "$json"; then
      run_state="$(ruby -rjson -e '
        run = JSON.parse(File.read(ARGV[0])).fetch("workflow_runs", []).first || {}
        puts [run["head_sha"], run["status"], run["conclusion"]].join(" ")
      ' "$json")"
      if [[ "$run_state" == "$expected_sha completed success" ]]; then
        return 0
      fi
    fi
    sleep 5
  done

  printf 'Latest Pages workflow state: %s\n' "${run_state:-unavailable}" >&2
  return 1
}

url_path_for_file() {
  ruby -ruri -e '
    puts "/" + ARGV[0].split("/").map { |part|
      URI.encode_www_form_component(part).gsub("+", "%20")
    }.join("/")
  ' "$1"
}

deploy_journal() {
  local journal="$1"
  shift
  local permalink title baseurl expected_sha render_url
  local rendered_html="$tmp_dir/rendered.html"
  local production_html="$tmp_dir/production.html"
  local asset_list="$tmp_dir/assets.txt"
  local href raw_path decoded file public_path code
  local static_root page_dir started_before started_after

  [[ -f "$journal" ]] || fail "Journal not found: $journal"
  journal="${journal#./}"
  is_active_journal "$journal" || fail "Not a Journal with top-level journal_type metadata: $journal"
  validate_metadata "$journal"

  for file in "$journal" "$@"; do
    [[ -f "$file" ]] || fail "File not found: $file"
    [[ "$file" != /* && "$file" != *'..'* ]] || fail "Paths must be repository-relative and may not contain '..': $file"
  done

  bash scripts/validate-journals.sh
  git diff --check -- "$journal" "$@"

  git fetch --quiet origin main
  for file in "$journal" "$@"; do
    git_blob_matches_origin "$file" || fail "$file does not match origin/main; commit and push only the requested source first"
  done

  expected_sha="$(git rev-parse origin/main)"
  wait_for_render "$expected_sha" || fail "Current origin/main has not completed a successful Pages render"

  permalink="$(front_matter_value "$journal" permalink)"
  title="$(front_matter_value "$journal" title)"
  baseurl="$(sed -n 's/^baseurl:[[:space:]]*//p' _config.yml | head -1)"
  render_url="${render_origin%/}${permalink}"
  curl -fsSL --connect-timeout 5 --max-time 30 "${render_url}?learningos-deploy=$(date +%s)" -o "$rendered_html" || \
    fail "Could not fetch rendered page: $render_url"
  grep -Fq "$title" "$rendered_html" || fail "Rendered page does not contain the expected title: $title"

  : > "$asset_list"
  grep -Eo '(src|href)="[^"]+"' "$rendered_html" |
    sed -E 's/^[^=]+="//; s/"$//' |
    while IFS= read -r href; do
      raw_path="${href%%\?*}"
      raw_path="${raw_path%%#*}"
      case "$raw_path" in
        "${baseurl}/"*) raw_path="${raw_path#"${baseurl}/"}" ;;
        /*) raw_path="${raw_path#/}" ;;
        *) continue ;;
      esac
      decoded="$(ruby -ruri -e 'puts URI::DEFAULT_PARSER.unescape(ARGV[0])' "$raw_path")"
      if [[ -f "$decoded" ]]; then
        printf '%s\n' "$decoded"
      fi
    done >> "$asset_list"

  for file in "$@"; do
    printf '%s\n' "$file" >> "$asset_list"
  done
  LC_ALL=C sort -u "$asset_list" -o "$asset_list"

  while IFS= read -r file; do
    [[ -n "$file" ]] || continue
    git_blob_matches_origin "$file" || fail "$file does not match origin/main; commit and push the referenced asset first"
  done < "$asset_list"

  sed "s#${baseurl}##g" "$rendered_html" > "$production_html"

  started_before="$(ssh -o BatchMode=yes -o ConnectTimeout=8 -p "$ssh_port" "$ssh_host" \
    "docker inspect -f '{{.State.StartedAt}}' '$container_name'")"
  static_root="$(ssh -o BatchMode=yes -o ConnectTimeout=8 -p "$ssh_port" "$ssh_host" \
    "docker inspect -f '{{range .Mounts}}{{if eq .Destination \"/srv/site\"}}{{.Source}}{{end}}{{end}}' '$container_name'")"
  [[ "$static_root" == /opt/learningjournal/site/* ]] || fail "Unexpected production static root: ${static_root:-<missing>}"

  page_dir="${static_root%/}${permalink}"
  ssh -o BatchMode=yes -o ConnectTimeout=8 -p "$ssh_port" "$ssh_host" "mkdir -p '$page_dir'"
  scp -q -P "$ssh_port" "$production_html" "$ssh_host:${page_dir}index.html"

  if [[ -s "$asset_list" ]]; then
    tar -cf - -T "$asset_list" |
      ssh -o BatchMode=yes -o ConnectTimeout=8 -p "$ssh_port" "$ssh_host" "tar -xf - -C '$static_root'"
  fi

  code="$(curl -L -sS -o "$tmp_dir/live.html" -w '%{http_code}' --connect-timeout 5 --max-time 30 \
    "${production_origin%/}${permalink}?learningos-deploy=$(date +%s)")"
  [[ "$code" == 200 ]] || fail "Production page returned HTTP $code"
  grep -Fq "$title" "$tmp_dir/live.html" || fail "Production page does not contain the expected title: $title"

  while IFS= read -r file; do
    [[ -n "$file" ]] || continue
    public_path="$(url_path_for_file "$file")"
    code="$(curl -L -sS -o /dev/null -w '%{http_code}' --connect-timeout 5 --max-time 30 \
      "${production_origin%/}${public_path}?learningos-deploy=$(date +%s)")"
    [[ "$code" == 200 ]] || fail "Production asset returned HTTP $code: $public_path"
  done < "$asset_list"

  started_after="$(ssh -o BatchMode=yes -o ConnectTimeout=8 -p "$ssh_port" "$ssh_host" \
    "docker inspect -f '{{.State.StartedAt}}' '$container_name'")"
  [[ "$started_after" == "$started_before" ]] || fail "Production container start time changed during deployment"

  printf 'Learning Journal Site deployment verified\n'
  printf 'Journal: %s\n' "$journal"
  printf 'Public URL: %s%s (HTTP 200)\n' "${production_origin%/}" "$permalink"
  printf 'Assets checked: %s\n' "$(wc -l < "$asset_list" | tr -d ' ')"
  printf 'Container start unchanged: %s\n' "$started_after"
}

if [[ $# -eq 0 ]]; then
  usage
  exit 2
fi

case "$1" in
  --audit)
    [[ $# -eq 1 ]] || fail "--audit does not accept additional arguments"
    audit_journals
    ;;
  -h|--help)
    usage
    ;;
  --*)
    usage >&2
    fail "Unknown option: $1"
    ;;
  *)
    deploy_journal "$@"
    ;;
esac
