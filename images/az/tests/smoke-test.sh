#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run ${IMAGE_NAME} --version
docker run ${IMAGE_NAME} --help
docker run ${IMAGE_NAME} sql --help
