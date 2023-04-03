#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

# Dev variants should have rustup
if [[ "${IMAGE_NAME}" = *-dev || "${IMAGE_TAG_SUFFIX}" = "-dev" ]]; then
    docker run --rm --entrypoint /usr/bin/rustup "${IMAGE_NAME}" target list
fi
