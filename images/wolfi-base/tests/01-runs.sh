#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

# Just test running with and without a command doesn't error
docker run --rm $IMAGE_NAME 
docker run --rm $IMAGE_NAME ls > /dev/null
