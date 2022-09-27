#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/sdk"}

docker run --rm --entrypoint bash "${IMAGE_NAME}" -xc \
    'export PATH="/root/go/bin:${PATH}" && \
     go version &&
     make --version &&
     curl --version &&
     git version &&
     apk --version &&
     bwrap --version &&
     melange version &&
     apko version'
