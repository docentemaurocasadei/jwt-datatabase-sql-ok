#!/bin/bash
set -euo pipefail

PROJECT_DIR="/opt/jwt-database-sql-ok"
VOLUME="jwt-database-sql-ok_voldb_jds_ok"
DIR="/backups/files/jds"
DATE="$(date +%Y%m%d_%H%M%S)"

VOLUME_BACKUP="$DIR/volume_$DATE.tar.gz"
SQL_BACKUP="$DIR/hamburgeria_$DATE.sql.gz"

cd "$PROJECT_DIR"
mkdir -p "$DIR"

echo "Creazione dump SQL..."

docker compose exec -T db \
  mysqldump \
  -uroot \
  -proot \
  --single-transaction \
  --routines \
  --triggers \
  --events \
  --databases hamburgeria \
  | gzip > "$SQL_BACKUP"

test -s "$SQL_BACKUP"

echo "Arresto MySQL per il backup fisico..."

docker compose stop db
trap 'docker compose start db >/dev/null 2>&1 || true' EXIT

docker run --rm \
  -v "$VOLUME:/data:ro" \
  -v "$DIR:/backup" \
  alpine \
  tar -czf "/backup/volume_$DATE.tar.gz" -C /data .

test -s "$VOLUME_BACKUP"

docker compose start db
trap - EXIT

find "$DIR" \
  -type f \
  \( -name "volume_*.tar.gz" -o -name "hamburgeria_*.sql.gz" \) \
  -mtime +14 \
  -delete

echo "Dump SQL: $SQL_BACKUP"
echo "Volume:   $VOLUME_BACKUP"