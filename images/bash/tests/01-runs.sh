#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm $IMAGE_NAME ls > /dev/null
#shouldn't error if run without cmd
docker run --rm $IMAGE_NAME
