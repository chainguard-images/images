#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"distroless.dev/alpine-base"}

docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test --file examples/Dockerfile examples
docker run smoke-test
