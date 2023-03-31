#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

# The image needs to be in a cluster to run, so we'll look for the right error message.
set +o pipefail
docker run --rm "${IMAGE_NAME}" 2>&1 | grep "Starting collector"
