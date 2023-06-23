#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm "${IMAGE_NAME}" digest cgr.dev/chainguard/static
