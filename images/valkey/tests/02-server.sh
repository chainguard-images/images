#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"valkey-smoketest-$(date +%s)-${RANDOM}"}


docker run -d -p ${FREE_PORT}:6379 --name $CONTAINER_NAME $IMAGE_NAME

trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME && rm ${CONTAINER_NAME}_${FREE_PORT}.txt" EXIT

sleep 15

( echo "SET mykey myvalue"; echo "GET mykey"; echo "QUIT" ) | nc localhost ${FREE_PORT} > ${CONTAINER_NAME}_${FREE_PORT}.txt

grep -q "myvalue"  ${CONTAINER_NAME}_${FREE_PORT}.txt

docker exec $CONTAINER_NAME  valkey-cli SET key1 1

docker exec $CONTAINER_NAME  valkey-cli INCR key1

docker exec $CONTAINER_NAME  valkey-cli get key1 | grep 2
