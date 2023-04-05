#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# Dev variants should have rustup
if [[ "${IMAGE_NAME}" = *-dev || "${IMAGE_TAG_SUFFIX}" = "-dev" ]]; then
    docker run --rm --entrypoint rustup "${IMAGE_NAME}" --version
fi
