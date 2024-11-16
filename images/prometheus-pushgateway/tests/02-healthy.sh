#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"prometheus-smoketest-${FREE_PORT}"}

docker run -p ${FREE_PORT}:9091 -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5
curl -L localhost:${FREE_PORT}/-/healthy | grep "OK"
