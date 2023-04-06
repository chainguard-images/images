#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi
IMAGE_TAG_SUFFIX=${IMAGE_TAG_SUFFIX:-""}

docker run --rm "${IMAGE_NAME}" --version

# Dev variants should have pip
if [[ "${IMAGE_NAME}" = *-dev || "${IMAGE_TAG_SUFFIX}" = "-dev" ]]; then
    docker run --rm --entrypoint /usr/bin/pip "${IMAGE_NAME}" --version
fi
