# Learning Journal Site production deployment

This file is the source of truth for publishing PHC Journals to the current
Learning Journal Site production site. Learning Journal Site is the
server-hosted website at `learning.lloydev.site`; LearningOS is a separate
system.

## Meaning of “sync to Learning Journal Site”

The production target is `https://learning.lloydev.site`. GitHub and GitHub
Pages are upstream source/rendering infrastructure; a push or a successful
Pages build is not proof that production was updated.

The repository command is:

```bash
# Audit every active Journal and its production route.
bash scripts/sync-journal-to-site.sh --audit

# Publish one Journal. Referenced repository assets are discovered and copied.
bash scripts/sync-journal-to-site.sh "Phy/Lesson 6 Net Force and Vectors Learning Journal.md"

# Extra asset paths may be supplied when an asset is not referenced in HTML.
bash scripts/sync-journal-to-site.sh "path/to/Journal.md" "path/to/extra-asset.jpg"
```

The command refuses to deploy a Journal that is missing required front matter,
does not match `origin/main`, or does not yet have a successful current Pages
render. This prevents stale HTML from overwriting production.

## Current production topology

- Hostname: `Temple`
- SSH endpoint: `root@46.62.212.36`, port `2222`, key authentication only
- Public domain: `https://learning.lloydev.site`
- Nginx: `/etc/nginx/conf.d/learningjournal.conf`
- HTTPS route: port `443` proxies to `127.0.0.1:4180`
- Application container: `learningjournal-static`
- Static mount inside the container: `/srv/site` (read-only)
- The host-side static directory is discovered from the running container at
  deploy time; do not hard-code or guess it.
- The comment API uses the existing local PostgreSQL database. A Journal-only
  deployment does not touch database credentials, schema, or data.

Do not store passwords, private keys, database URLs, Cloudflare tokens, or
other secrets in this repository.

## What the command does

1. Validates the selected file's Journal metadata and `permalink`.
2. Checks Journal structure with `scripts/validate-journals.sh` and checks the
   selected paths with `git diff --check`.
3. Confirms the selected source and explicit assets are identical to
   `origin/main`.
4. Waits for the current GitHub Pages build, downloads that rendered page, and
   rewrites the GitHub project base path to production-root URLs.
5. Discovers repository-hosted assets referenced by the rendered HTML.
6. Reads the active `/srv/site` host mount from `learningjournal-static`, then
   uploads only the selected page and assets. It does not restart the service.
7. Verifies the exact public page, its expected title, local assets, and the
   unchanged container start time.

If step 3 or 4 fails, commit and push only the requested Journal and its assets,
wait for the build, and run the command again. Review `git status` first; do not
use a broad `git add -A` in a dirty worktree.

## Completion evidence

Report separately:

- source validation result;
- Git/Pages render state;
- production page URL and HTTP status;
- referenced asset HTTP status;
- whether the production container start time stayed unchanged.

Do not describe a local file, Git commit, push, Pages URL, or health endpoint as
production completion by itself.
