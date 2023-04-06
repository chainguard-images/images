#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm "${IMAGE_NAME}" -h google.com -p 80
