#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"nginx-smoketest-$(date +%s)"}

docker run -p 8080:8080 -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5

curl -v --max-time 10 http://localhost:8080/ | grep '<title>Welcome to nginx!</title>' || \
    curl -v --max-time 10 http://localhost:8081/ | grep '<title>Welcome to nginx!</title>'
