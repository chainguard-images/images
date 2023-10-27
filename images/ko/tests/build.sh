#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm \
    -v "${PWD}/example:/work" \
    --workdir=/work \
    -e KO_DOCKER_REPO=example.com \
    -e CGO_ENABLED=1 \
    "${IMAGE_NAME}" build ./ \
    --push=false \
    --preserve-import-paths \
    --verbose
