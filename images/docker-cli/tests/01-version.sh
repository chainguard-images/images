#!/usr/bin/env bash

# Cannot use -o pipefail here because that causes the docker run command to fail immediately
set -o errexit -o nounset -o errtrace -x

docker run --rm ${IMAGE_NAME} version 2>&1 | grep -i 'cannot connect to the Docker daemon'
