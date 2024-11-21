#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm "${IMAGE_NAME}" -i 'the answer is: {{ mul 6 7 }}'