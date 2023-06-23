#!/usr/bin/env bash

#set -o errexit -o nounset -o errtrace -o pipefail -x
set -o errexit -o nounset -o errtrace -o pipefail

docker run --rm "${IMAGE_NAME}" --version | grep -i '^oauth2-proxy'
