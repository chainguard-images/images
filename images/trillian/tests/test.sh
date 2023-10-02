#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x


TMP="$(mktemp -d)"
pushd "${TMP}"

# Grabbed this from trillian
# https://github.com/google/trillian/blob/master/examples/deployment/docker-compose.yml
cat <<EOF > docker-compose.yml

version: '3.4'
services:
  mysql:
    image: gcr.io/trillian-opensource-ci/db_server:v1.5.2
    environment:
      - MYSQL_ROOT_PASSWORD=zaphod
      - MYSQL_DATABASE=test
      - MYSQL_USER=test
      - MYSQL_PASSWORD=zaphod
    restart: always # keep the MySQL server running
  trillian-log-server:
    image: $TRILLIAN_LOG_SERVER
    command: [
      "--storage_system=mysql",
      "--mysql_uri=test:zaphod@tcp(mysql:3306)/test",
      "--rpc_endpoint=0.0.0.0:8090",
      "--http_endpoint=0.0.0.0:8091",
      "--alsologtostderr",
    ]
    restart: always # retry while mysql is starting up
    ports:
      - "8090:8090"
      - "8091:8091"
    depends_on:
      - mysql
  trillian-log-signer:
    image: $TRILLIAN_LOG_SIGNER
    command: [
      "--storage_system=mysql",
      "--mysql_uri=test:zaphod@tcp(mysql:3306)/test",
      "--rpc_endpoint=0.0.0.0:8090",
      "--http_endpoint=0.0.0.0:8091",
      "--force_master",
      "--alsologtostderr",
    ]
    restart: always # retry while mysql is starting up
    ports:
      - "8092:8091"
    depends_on:
      - mysql
EOF

docker compose up --wait
curl --retry 10 --retry-all-errors localhost:8091/metrics
docker compose down
