#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CONTAINER_NAME=${CONTAINER_NAME:-"nginx-smoketest-$(date +%s)"}

# The "-p 8080:8080 -p 8081:80" is a temporary hack to support both images
# Port will 8080 after May 3, and we can drop anything port 8081 or port 80 from this file
docker run -p 8080:8080 -p 8081:80 -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5

curl -v --max-time 10 http://localhost:8080/ | grep '<title>Welcome to nginx!</title>' || \
    curl -v --max-time 10 http://localhost:8081/ | grep '<title>Welcome to nginx!</title>'
