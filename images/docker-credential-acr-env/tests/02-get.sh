#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# The image fails if it can't connect to the server URL, so we need to just make sure it fails correctly.
set +o pipefail
docker run --rm "${IMAGE_NAME}" get  2>&1 | grep "no credentials server URL"
