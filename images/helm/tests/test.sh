#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.helm.ref')

docker run --rm "$image" help
