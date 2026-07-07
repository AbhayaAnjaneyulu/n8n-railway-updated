Custom n8n image for the Clik-Works Railway deployment.

- Pins n8n version so image bumps do not surprise-upgrade the container.
- Runtime `chown` of `/home/node/.n8n` because Railway mounts the volume as `root:root` but n8n runs as `node`.
- Drops back to `node` via `su-exec` after `chown`.

`N8N_ENCRYPTION_KEY` must be set as an explicit env var on the Railway service — never rely on the auto-generated `config` file.
