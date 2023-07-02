#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${IMAGE_NAME}"

# Run zig build run and make sure the output is as expected

APPDIR=$(TMPDIR=$(pwd) mktemp -d)

# Try to cleanup, but don't error if it fails
trap "rm -rf ${APPDIR} || true" EXIT

# We need to set this liberally since a non-root user will get mounted in and need to read/write/execute in there.
chmod 777 $APPDIR

# Setup a zig sample app and run it!
docker run --rm -v ${APPDIR}:/work --workdir /work "${IMAGE_NAME}" init-exe
docker run --rm -v ${APPDIR}:/work --workdir /work "${IMAGE_NAME}" build run 2>&1 | grep "All your codebase are belong to us" 
