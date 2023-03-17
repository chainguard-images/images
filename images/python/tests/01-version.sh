#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}
IMAGE_TAG_SUFFIX=${IMAGE_TAG_SUFFIX:-""}

docker run --rm "${IMAGE_NAME}" --version

# Dev variants should have pip
if [[ "${IMAGE_NAME}" = *-dev || "${IMAGE_TAG_SUFFIX}" = "-dev" ]]; then
    docker run --rm --entrypoint /usr/bin/pip "${IMAGE_NAME}" --version
fi
