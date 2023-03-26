#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

# Help exits with 1 for some reason, so disable pipefail
set +o pipefail
docker run --rm "${IMAGE_NAME}" --help 2>&1 | grep secrets-store-csi
