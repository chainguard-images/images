#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# The help command exists with a non-zero exit code, so we need to just make sure it fails correctly.
set +o pipefail
docker run --rm "${IMAGE_NAME}" 2>&1 | grep "unable to load"