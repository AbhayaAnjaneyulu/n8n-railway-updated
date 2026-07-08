#!/bin/sh
set -e

# Railway mounts the volume at /home/node/.n8n owned by root.
# n8n runs as 'node' (UID 1000) so we must fix ownership at runtime
# before dropping privileges.
chown -R node:node /home/node/.n8n

exec gosu node tini -- /docker-entrypoint.sh "$@"
