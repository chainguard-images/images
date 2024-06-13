#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm \
  -v $(pwd)/hello:/hello \
  -w /hello \
   ${IMAGE_NAME} build .
