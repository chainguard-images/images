#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# to prevent duplicate container name issues when we run similar tests for both versions within the configs/ folder.
CONTAINER_NAME=${CONTAINER_NAME:-"redis-smoketest-$(date +%s)-$(uuidgen)"}

# Run two containers on the same network (just use host for simplicity)
# The server should start up and listen, and the client will run ping

docker run -d -p ${FREE_PORT}:6379 --name $CONTAINER_NAME $IMAGE_NAME

trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME && rm ${CONTAINER_NAME}_${FREE_PORT}.txt" EXIT

sleep 15

# Send commands to Redis via nc
( echo "SET mykey myvalue"; echo "GET mykey"; echo "QUIT" ) | nc localhost ${FREE_PORT} > ${CONTAINER_NAME}_${FREE_PORT}.txt

# Check if the command passed
grep -q "myvalue"  ${CONTAINER_NAME}_${FREE_PORT}.txt
