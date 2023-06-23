#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"postgres-$(date +%s)"}

docker run --network=host -e POSTGRES_PASSWORD=password -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5
docker run --network=host --entrypoint=/usr/bin/psql $IMAGE_NAME -U postgres -h 127.0.0.1 -l -t --csv | head -n 1 | grep postgres
