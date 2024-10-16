#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# to prevent duplicate container name issues when we run similar tests for both versions within the configs/ folder.
CONTAINER_NAME=${CONTAINER_NAME:-"redis-defragtest-$(date +%s)-$(uuidgen)"}

# Turn on activedefrag to ensure redis is being built with jemalloc

docker run -d --name $CONTAINER_NAME $IMAGE_NAME

trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT

sleep 15

docker exec -i $CONTAINER_NAME redis-cli config set activedefrag yes | grep OK

# Check if the setting took
docker exec -i $CONTAINER_NAME redis-cli config get activedefrag | grep "yes"
