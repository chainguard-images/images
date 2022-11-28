#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/nginx"}
CONTAINER_NAME=${CONTAINER_NAME:-"nginx-smoketest-$(date +%s)"}

docker run -p 8080:80 -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker rm -f $CONTAINER_NAME" EXIT

curl -v --max-time 10 http://localhost:8080/ | grep '<title>Welcome to nginx!</title>'
