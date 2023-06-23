#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run $IMAGE_NAME help
