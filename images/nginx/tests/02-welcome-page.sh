#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

CONTAINER_NAME=${CONTAINER_NAME:-"nginx-smoketest-$(date +%s)"}

docker run -p 8080:80 -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT

curl -v --max-time 10 http://localhost:8080/ | grep '<title>Welcome to nginx!</title>'
