#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

# The image can't run off of k8s, so run it and make sure it at least throws the right error.
set +o pipefail
docker run --rm "${IMAGE_NAME}" 2>&1 | grep karpenter
