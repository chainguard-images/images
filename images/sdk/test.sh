#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"distroless.dev/sdk"}

docker run --rm --entrypoint bash "${IMAGE_NAME}" -xc \
    'export PATH="/root/go/bin:${PATH}" && \
     which goimports &&
     go version &&
     make --version &&
     curl --version &&
     git version &&
     apk --version &&
     bwrap --version &&
     melange version &&
     apko version'
