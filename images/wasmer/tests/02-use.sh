#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"

function cleanup() {
  rm -rf "${TMPDIR}"
}
trap cleanup EXIT

chmod -R 777 "${TMPDIR}"

cp helloworld.go "${TMPDIR}"
docker run --rm -v "${TMPDIR}:/work" \
  -w /work \
  --env GOARCH=wasm \
  --env GOOS=wasip1 \
  cgr.dev/chainguard/go:latest \
    build -o wasmtest helloworld.go

echo "${IMAGE_NAME}"

docker run --rm -v "${TMPDIR}:/work" -w /work "${IMAGE_NAME}" run /work/wasmtest | grep "Hello, World!"
