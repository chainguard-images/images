#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm \
    -v "${PWD}/example:/work" \
    --workdir=/work \
    -e KO_DOCKER_REPO=example.com \
    -e CGO_ENABLED=1 \
    "${IMAGE_NAME}" build ./ \
    --push=false \
    --preserve-import-paths \
    --verbose
