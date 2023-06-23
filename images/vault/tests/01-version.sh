#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --cap-add IPC_LOCK --rm "${IMAGE_NAME}" --version
