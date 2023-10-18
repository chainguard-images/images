#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Build a simple image
TMPDIR="$(mktemp -d)"
echo "FROM scratch" > ${TMPDIR}/Dockerfile
docker run \
  --rm \
  --privileged \
  -v ${TMPDIR}:/tmp/work \
  --entrypoint buildctl-daemonless.sh \
  ${IMAGE_NAME} \
      build \
      --frontend dockerfile.v0 \
      --local context=/tmp/work \
      --local dockerfile=/tmp/work