#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run -u root --entrypoint sh --rm "${IMAGE_NAME}" -c "pip install numpy; python -c 'import numpy; print(numpy.__version__)'"
