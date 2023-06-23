#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"nats-${FREE_PORT}"}

docker run -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5

# We just use the latest stable dev image here for testing the server.
# Do this first to pre-pull the image.
docker run --rm cgr.dev/chainguard/nats:latest-dev --version

# Start subscribing in the background, and expect a message with our pseudo-random port number
( docker run --rm --link $CONTAINER_NAME --entrypoint=nats cgr.dev/chainguard/nats:latest-dev sub --server $CONTAINER_NAME foo --count=1 | grep test-message-${FREE_PORT} ) &
pid=$!

# Give that a moment to block, and then send a message on that topic matching the text it expects.
sleep 2
docker run --rm --link $CONTAINER_NAME --entrypoint=nats cgr.dev/chainguard/nats:latest-dev pub --server $CONTAINER_NAME foo test-message-${FREE_PORT}

# Wait for the subscriber to receive the message with a successful exit code.
wait $pid
