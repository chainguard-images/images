#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

cd "$(dirname ${BASH_SOURCE[0]})/.."

docker build --build-arg BASE="${IMAGE_NAME}" --tag smoke-test --file examples/Dockerfile.c examples
docker run --rm smoke-test
