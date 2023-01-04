#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/ruby"}

# Smoke test running irb and ruby
docker run $IMAGE_NAME ruby -v
docker run $IMAGE_NAME irb -v
