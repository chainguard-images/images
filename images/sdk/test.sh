#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"unset"}
if [[ "${IMAGE_NAME}" == "unset" ]]; then
    echo "Must set IMAGE_NAME in the environment. Exiting."
    exit 1
fi

docker run --rm --entrypoint bash "${IMAGE_NAME}" -xc \
    'which goimports &&
     tree --version &&
     go version &&
     make --version &&
     curl --version &&
     git version &&
     apk --version &&
     bwrap --version &&
     melange version &&
     apko version'
