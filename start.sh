#!/bin/sh
# Builds the login from Railway variables, then starts the web server.
set -e
if [ -z "$APP_PASSWORD" ]; then
  echo "APP_PASSWORD is not set in Railway Variables" >&2
  exit 1
fi
export APP_USER="${APP_USER:-nicholas}"
AUTH_HASH="$(caddy hash-password --plaintext "$APP_PASSWORD")"
export AUTH_HASH
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
