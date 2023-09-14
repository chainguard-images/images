#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${IMAGE_NAME}"

# Start a postgres image
POSTGRES_CONTAINER_NAME=${POSTGRES_CONTAINER_NAME:-"postgres-${RANDOM}"}
NETWORK_NAME="postgres-${RANDOM}"
PGBOUNCER_CONTAINER_NAME=${PGBOUNCER_CONTAINER_NAME:-"pgbouncer-${RANDOM}"}

cleanup() {
    rm -f ${POSTGRES_CONTAINER_NAME}.ini
    docker kill ${POSTGRES_CONTAINER_NAME}
    docker kill ${PGBOUNCER_CONTAINER_NAME}
    docker network rm ${NETWORK_NAME}
}
trap cleanup EXIT


docker network create ${NETWORK_NAME}

docker run --rm -e POSTGRES_PASSWORD=password -d --network=${NETWORK_NAME} --name ${POSTGRES_CONTAINER_NAME} cgr.dev/chainguard/postgres:latest

# Create a pgbouncer.ini file
cat <<EOF > ${POSTGRES_CONTAINER_NAME}.ini
[databases]
* = host=${POSTGRES_CONTAINER_NAME} port=5432 user=postgres password=password

[pgbouncer]
listen_port = 55432
listen_addr = 0.0.0.0
pidfile = /tmp/pgbouncer.pid
auth_type = any
EOF

PGBOUNCER_CONTAINER_NAME=${PGBOUNCER_CONTAINER_NAME:-"pgbouncer-${RANDOM}"}
docker run -d --name "${PGBOUNCER_CONTAINER_NAME}" --network ${NETWORK_NAME} -v $(pwd):/work ${IMAGE_NAME} /work/${POSTGRES_CONTAINER_NAME}.ini 

# The postgres container has bash and the client, so use that container to connect back to itself, through the pgbouncer container.
docker exec ${POSTGRES_CONTAINER_NAME} psql -p 55432 -h ${PGBOUNCER_CONTAINER_NAME} -d postgres -t -c "select 'hello'" | grep hello
