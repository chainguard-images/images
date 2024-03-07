#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"

function cleanup() {
  rm -rf "${TMPDIR}"
}
trap cleanup EXIT

cp helloworld.go "${TMPDIR}"
docker run --rm -v "${TMPDIR}:/work" \
  -w /work \
  tinygo/tinygo:0.31.1 \
    tinygo build -o wasmtest -target wasi helloworld.go

echo "${IMAGE_NAME}"

docker run --rm -v "${TMPDIR}:/work" -w /work "${IMAGE_NAME}" run /work/wasmtest | grep "Hello, World!"
