#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# Help exits with 1 for some reason, so disable pipefail
set +o pipefail
docker run --rm "${IMAGE_NAME}" --help 2>&1 | grep secrets-store-csi

# The image must have mount installed.
docker run --rm --entrypoint mount "${IMAGE_NAME}" --help
