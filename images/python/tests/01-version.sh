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

# Test c extensions (numpy) in the dev image
if [[ "${IMAGE_NAME}" = *-dev || "${IMAGE_TAG_SUFFIX}" = "-dev" ]]; then
    docker run -u root --entrypoint sh --rm "${IMAGE_NAME}" -c "pip install numpy; python -c 'import numpy; print(numpy.__version__)'"
fi
