#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

URL="https://raw.githubusercontent.com/chainguard-images/images/main/README.md"
docker run --rm "${IMAGE_NAME}" -v "${URL}"
