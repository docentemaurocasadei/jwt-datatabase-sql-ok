#!/bin/bash
set -e

CONTAINER="db_jds_ok"
VOLUME="jwt-datatabase-sql-ok_voldb_jds_ok"
DIR="/backups/files/jds"
DATE="$(date +%Y%m%d_%H%M%S)"

mkdir -p "$DIR"

docker stop "$CONTAINER"

# Riavvia MySQL anche se il backup fallisce
trap 'docker start "$CONTAINER" >/dev/null 2>&1 || true' EXIT

docker run --rm \
  -v "$VOLUME:/data:ro" \
  -v "$DIR:/backup" \
  alpine \
  tar -czf "/backup/volume_$DATE.tar.gz" -C /data .

docker start "$CONTAINER"
trap - EXIT

find "$DIR" \
  -type f \
  -name "volume_*.tar.gz" \
  -mtime +14 \
  -delete