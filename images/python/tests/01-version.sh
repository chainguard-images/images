#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.python.ref')

# Test python version
docker run --rm "${image}" --version