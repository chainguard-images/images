#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"unset"}
if [[ "${IMAGE_NAME}" == "unset" ]]; then
    echo "Must set IMAGE_NAME in the environment. Exiting."
    exit 1
fi

docker build --build-arg BASE="${IMAGE_NAME}" --tag smoke-test --file examples/Dockerfile.c examples
docker run smoke-test
