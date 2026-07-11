# Network
docker network create net_jds_ok

# Volume persistente MySQL
docker volume create voldb_jds_ok

# Container MySQL
docker run -d \
  --name db_jds_ok \
  --network net_jds_ok \
  -p 127.0.0.1:3320:3306 \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=hamburgeria \
  -v voldb_jds_ok:/var/lib/mysql \
  -v "$(pwd)/db/db.sql:/docker-entrypoint-initdb.d/01-db.sql:ro" \
  mysql:8.4

# Build immagine NestJS
docker build -t app_jds_ok .

# Container NestJS
docker run -d \
  --name app_jds_ok \
  --network net_jds_ok \
  -p 3000:3000 \
  app_jds_ok

  # Per rilanciare resettando il database
docker rm -f db_jds_ok
docker volume rm voldb_jds_ok
docker volume create voldb_jds_ok

# importare il db manualmente
docker exec -i db_jds_ok mysql -uroot -proot hamburgeria < db/db.sql