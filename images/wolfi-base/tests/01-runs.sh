#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# Just test running with and without a command doesn't error
docker run --rm $IMAGE_NAME 
docker run --rm $IMAGE_NAME ls > /dev/null
