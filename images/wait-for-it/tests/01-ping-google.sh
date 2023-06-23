#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x -x

docker run --rm "${IMAGE_NAME}" -h google.com -p 80
