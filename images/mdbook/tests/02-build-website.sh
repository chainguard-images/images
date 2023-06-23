#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm \
    -v "${PWD}":/work \
    -w /work \
    "${IMAGE_NAME}" \
    init --force --title chainguard-images /tmp/mdbook
