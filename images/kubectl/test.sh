#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/kubectl"}

docker run $IMAGE_NAME version | grep "Client Version"
