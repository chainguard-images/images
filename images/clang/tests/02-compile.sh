#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm -v "${PWD}/images/clang:/work" $IMAGE_NAME examples/hello/main.c -o hello
