#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cd "$(dirname ${BASH_SOURCE[0]})/.."

for lang in c golang rust; do
  docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test-${lang}-${FREE_PORT} --file examples/Dockerfile.${lang} examples
  docker run --rm smoke-test-${lang}-${FREE_PORT}
done
