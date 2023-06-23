#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm --entrypoint /usr/bin/pip "${IMAGE_NAME}" --version
