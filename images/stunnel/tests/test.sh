#!/bin/sh

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.stunnel.ref')

docker run --rm "${image}" -help

