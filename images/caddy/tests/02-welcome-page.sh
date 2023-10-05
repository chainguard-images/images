#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"caddy-smoketest-${FREE_PORT}"}

docker run -p "${FREE_PORT}:443" -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5

curl -v --insecure --max-time 10 https://localhost:${FREE_PORT}/ | grep '<title>Welcome to Caddy!</title>' || \
    curl -v --max-time 10 http://localhost/ | grep '<title>Welcome to Caddy!</title>'
