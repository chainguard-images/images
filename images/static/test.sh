#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/static"}

for lang in c golang rust; do
  docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test-${lang} --file examples/Dockerfile.${lang} examples
  docker run smoke-test-${lang}
done
