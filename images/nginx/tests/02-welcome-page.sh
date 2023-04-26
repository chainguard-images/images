#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# Temporary hack to support both images
# Port will 8080 after May 3.
if [[ "${IMAGE_NAME}" =~ .*next.* ]]; then
    PORT=8080
else
    PORT=80
fi
echo "PORT $PORT"

CONTAINER_NAME=${CONTAINER_NAME:-"nginx-smoketest-$(date +%s)"}

docker run -p 8080:$PORT -d --name $CONTAINER_NAME $IMAGE_NAME
trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
sleep 5
curl -v --max-time 10 http://localhost:8080/ | grep '<title>Welcome to nginx!</title>'
