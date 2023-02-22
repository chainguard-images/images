#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

docker run --rm $IMAGE_NAME version
docker run --rm --entrypoint /usr/bin/git $IMAGE_NAME version
docker run --rm --entrypoint /usr/bin/ssh $IMAGE_NAME -V
