#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CONTAINER_NAME=${CONTAINER_NAME:-"nats-$(date +%s)"}

docker run --network=host -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5

# We just use the latest stable dev image here for testing the server.
docker run --network=host -d --entrypoint=nats --name $CONTAINER_NAME-sub cgr.dev/chainguard/nats:latest-dev sub foo --count=1
docker run --network=host -d --entrypoint=nats --name $CONTAINER_NAME-pub cgr.dev/chainguard/nats:latest-dev pub foo test-message

docker logs $CONTAINER_NAME-sub 2>&1 | grep "Received on"
docker logs $CONTAINER_NAME-sub 2>&1 | grep "test-message"
