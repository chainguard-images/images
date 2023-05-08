#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm $IMAGE_NAME version
