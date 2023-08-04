#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

set +o pipefail  # We expect the command to fail, but want its output anyway.

docker run --rm "${IMAGE_NAME}" 2>&1 | grep "unable to load"

