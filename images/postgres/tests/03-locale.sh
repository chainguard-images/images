#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"postgres-$(date +%s)"}

docker run -e POSTGRES_PASSWORD=password -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5
docker exec $CONTAINER_NAME /usr/bin/psql -U postgres -t --csv -c "show server_encoding;" | head -n 1 | grep UTF8
