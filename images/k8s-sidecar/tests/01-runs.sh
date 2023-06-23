#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The image needs to be in a cluster to run, so we'll look for the right error message.
set +o pipefail
docker run --rm "${IMAGE_NAME}" 2>&1 | grep "Starting collector"
