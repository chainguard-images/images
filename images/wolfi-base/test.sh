#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/wolfi-base"}

# Just test running with and without a command doesn't error
docker run $IMAGE_NAME 
docker run $IMAGE_NAME ls > /dev/null
