#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker build -t deno-test -f example/Dockerfile example/ --build-arg=base=${IMAGE_NAME}
