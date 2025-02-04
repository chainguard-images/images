#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.rust.ref')

docker run --rm "${image}" --version

if docker run --rm --entrypoint sh "${image}" -c 'command -v rustup'; then
    docker run --rm --entrypoint rustup "${image}" --version
fi
