#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cd "$(dirname ${BASH_SOURCE[0]})/.."

# Using registry.local:5000 as the BASE arg in `docker build` fails with
# current versions of docker that use containerd under the hood.
# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull ${IMAGE_NAME}

for lang in c golang rust; do
  docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test-${lang}-${FREE_PORT} --file examples/Dockerfile.${lang} examples
  docker run --rm smoke-test-${lang}-${FREE_PORT}
done
