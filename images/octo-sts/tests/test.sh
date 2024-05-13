#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# We expect the command to fail, but want its output anyway.
set +o pipefail

docker run --rm $IMAGE_NAME |& grep 'failed to process env var: required key PORT missing value'
