#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# The image can't run off without a valid kuberentes cluster, so run it and make sure it at least throws the right error.
set +o pipefail
docker run --rm "${IMAGE_NAME}" 2>&1 | grep "unable to load controller config"
