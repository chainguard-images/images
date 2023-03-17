#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}
IMAGE_TAG_SUFFIX=${IMAGE_TAG_SUFFIX:-""}

docker run --entrypoint php --rm "${IMAGE_NAME}" --version

# Dev variants should have composer
if [[ "${IMAGE_NAME}" = *-dev || "${IMAGE_TAG_SUFFIX}" = "-dev" ]]; then
    docker run --entrypoint composer --rm "${IMAGE_NAME}" --version
fi

# FPM variants should have php-fpm
if [[ "${IMAGE_NAME}" = *-fpm || "${IMAGE_TAG_SUFFIX}" = "-fpm" ]]; then
    docker run --entrypoint php-fpm --rm "${IMAGE_NAME}" -v
fi
