#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.curl.ref')

# Test basic command
docker run --rm "$image" --version

URL="https://raw.githubusercontent.com/chainguard-images/images/main/README.md"
docker run --rm "$image" -v "${URL}"

