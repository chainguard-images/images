#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CID=$(docker run -d --privileged ${IMAGE_NAME})
trap "docker container rm -f ${CID}" EXIT
export BUILDKIT_HOST="docker-container://${CID}"

# Wait for buildkitd to be ready
for i in $(seq 1 10); do
  buildctl debug workers && break
  sleep 1
done

# Build a simple image
TMPDIR="$(mktemp -d)"
echo "FROM scratch" > ${TMPDIR}/Dockerfile
buildctl build \
    --frontend=dockerfile.v0 \
    --local context=${TMPDIR} \
    --local dockerfile=${TMPDIR}