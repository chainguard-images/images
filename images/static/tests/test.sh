#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.static.ref')

# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull "${image}"

for lang in c golang rust; do
  docker build --build-arg BASE="${image}" --tag smoke-test-${lang} --file examples/Dockerfile.${lang} examples
  docker run --rm smoke-test-${lang}
done
