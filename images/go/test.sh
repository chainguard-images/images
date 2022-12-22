#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/go"}

docker run $IMAGE_NAME version
docker run --entrypoint /usr/bin/git $IMAGE_NAME version
docker run --entrypoint /usr/bin/ssh $IMAGE_NAME -V
