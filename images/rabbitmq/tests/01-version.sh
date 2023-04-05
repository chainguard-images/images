#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# TODO: no way to get version from rabbitmq-server?
docker run --rm --entrypoint rabbitmqctl "${IMAGE_NAME}" version
