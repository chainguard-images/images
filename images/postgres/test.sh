#!/usr/bin/env bash

set -x
set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"unset"}
if [[ "${IMAGE_NAME}" == "unset" ]]; then
    echo "Must set IMAGE_NAME in the environment. Exiting."
    exit 1
fi

docker run --rm "${IMAGE_NAME}" --version \
    | grep '^postgres (PostgreSQL) '
