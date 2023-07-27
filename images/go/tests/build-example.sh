#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The image can be run to build an application that has external dependencies.
docker run --rm \
  -v $(pwd)/hello:/hello \
  -w /hello \
   ${IMAGE_NAME} build .
