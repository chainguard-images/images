#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CONTAINER_NAME=${CONTAINER_NAME:-"redis-smoketest-$(date +%s)"}

# Run two containers on the same network (just use host for simplicity)
# The server should start up and listen, and the client will run ping

docker run -p 6379:6379 -d --name $CONTAINER_NAME --network=host $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5
docker run --rm --entrypoint=/usr/bin/redis-cli --network=host $IMAGE_NAME ping | grep PONG
