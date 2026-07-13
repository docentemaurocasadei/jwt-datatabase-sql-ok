#!/bin/bash
set -euo pipefail

PROJECT_DIR="/opt/jwt-database-sql-ok/"
VOLUME="jwt-database-sql-ok_voldb_jds_ok"
DIR="/backups/files/jds"
DATE="$(date +%Y%m%d_%H%M%S)"

cd "$PROJECT_DIR"
mkdir -p "$DIR"

docker compose stop db

trap 'docker compose start db >/dev/null 2>&1 || true' EXIT

docker run --rm \
  -v "$VOLUME:/data:ro" \
  -v "$DIR:/backup" \
  alpine \
  tar -czf "/backup/volume_$DATE.tar.gz" -C /data .

docker compose start db
trap - EXIT

find "$DIR" \
  -type f \
  -name "volume_*.tar.gz" \
  -mtime +14 \
  -delete