#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run $IMAGE_NAME -zv google.com 443 2>&1 | grep "443 port \[tcp/https\] succeeded"
