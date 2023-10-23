#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm $IMAGE_NAME ls > /dev/null

docker run --rm $IMAGE_NAME whoami | grep root
