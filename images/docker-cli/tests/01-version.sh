#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm ${IMAGE_NAME} version 2>&1 | grep -qi "Cannot connect to the Docker daemon"
