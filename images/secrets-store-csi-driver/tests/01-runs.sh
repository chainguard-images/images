#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

set +o pipefail  # We expect the command to fail, but want its output anyway.

docker run --rm "${IMAGE_NAME}" --help 2>&1 | grep secrets-store-csi

# The image must have mount installed.
docker run --rm --entrypoint mount "${IMAGE_NAME}" --help
