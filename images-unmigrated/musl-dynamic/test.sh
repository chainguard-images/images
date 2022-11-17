#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/musl-dynamic"}

docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test --file examples/Dockerfile.c examples
docker run smoke-test
