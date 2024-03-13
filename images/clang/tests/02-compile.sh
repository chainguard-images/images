#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Run inside the images/clang/ directory
workdir="$(realpath "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../")"

docker run --rm \
    -v "${workdir}:/work" \
    -w /work/examples/hello \
    $IMAGE_NAME main.c -o hello
