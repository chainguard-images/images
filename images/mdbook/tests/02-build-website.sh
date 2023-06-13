#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm \
    -v "${PWD}":/work \
    -w /work \
    "${IMAGE_NAME}" \
    init --force --title chainguard-images /tmp/mdbook
