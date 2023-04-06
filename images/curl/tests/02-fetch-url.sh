#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

URL="https://raw.githubusercontent.com/chainguard-images/images/main/README.md"
docker run --rm "${IMAGE_NAME}" -v "${URL}"
