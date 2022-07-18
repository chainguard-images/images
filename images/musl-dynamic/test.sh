#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

IMAGE_NAME=${IMAGE_NAME:-"distroless.dev/musl-dynamic"}
TARBALL_URL=${TARBALL_URL:-"https://github.com/google/ko/releases/download/v0.11.2/ko_0.11.2_Linux_x86_64.tar.gz"}
EXE_FILENAME=${EXE_FILENAME:-"ko"}
EXE_CMD=${EXE_CMD:-"version"}

if [[ ! -f smoketest.tar.gz ]]; then
    curl -L -o smoketest.tar.gz "${TARBALL_URL}"
fi

if [[ ! -f "smoketest/${EXE_FILENAME}" ]]; then
    rm -rf smoketest && mkdir smoketest
    tar -xf smoketest.tar.gz -C smoketest
fi

# Mount the downloaded executable and try to run it
docker run --rm -v "${PWD}/smoketest/${EXE_FILENAME}":/exe --entrypoint /exe "${IMAGE_NAME}" "${EXE_CMD}"
