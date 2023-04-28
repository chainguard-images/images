#!/usr/bin/env bash

#set -o errexit -o nounset -o errtrace -o pipefail -x
set -o errexit -o nounset -o errtrace -o pipefail

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm --entrypoint=bin/oauth2-proxy "${IMAGE_NAME}" --version \
    | grep -i '^oauth2-proxy'
