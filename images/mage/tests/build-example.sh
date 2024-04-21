#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm \
  -v $(pwd)/mage:/mage \
  -w /mage \
   ${IMAGE_NAME} hello
