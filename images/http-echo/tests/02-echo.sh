#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CONTAINER=$(docker run -p ${FREE_PORT}:8080 -d --rm "${IMAGE_NAME}" -listen=:8080 -text="hello world")
curl localhost:${FREE_PORT} | grep "hello world"
docker kill $CONTAINER
