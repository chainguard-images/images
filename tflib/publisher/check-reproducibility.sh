#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

TMP=$(mktemp)

if ! cosign download attestation \
   --predicate-type https://apko.dev/image-configuration \
  "${IMAGE_NAME}" | jq -r .payload | base64 -d | jq .predicate > "${TMP}" ; then
  if env | grep ACTIONS_ID_TOKEN_REQUEST_URL ; then
    # The ID token endpoint in actions is available, so things SHOULD fail.
    exit 1
  fi
  # To support running things locally, where we don't currently support signing,
  # make the absence of the attestation non-fatal.
  echo Skipping reproducibility test due to missing attestation.
  exit 0
fi

# TODO(mattmoor): switch this to cgr.dev/chainguard/crane registry serve
# once we cut a release to make this listen on more than loopback.
# Note: we expose the port here (even unused) to "claim" the port and
# avoid naming collisions.
docker run -d -p ${FREE_PORT}:5000 --name "registry-${FREE_PORT}.local" registry:2

trap "docker rm -f registry-${FREE_PORT}.local" EXIT

# Update this with the latest APKO once it is rebuilt.
REBUILT_IMAGE_NAME=$(docker run --rm \
   --link "registry-${FREE_PORT}.local" \
   -v "${TMP}:/tmp/latest.apko.json" \
   -v ${PWD}:/work:ro -w /work \
   ghcr.io/wolfi-dev/apko:latest@sha256:4f747c533aa5b2bad01c64ec12e73a9c933510c2918d3c40a0e85b113e014ac3 \
   publish /tmp/latest.apko.json registry-${FREE_PORT}.local:5000/reproduction
)

ORIGINAL_DIGEST=$(echo "${IMAGE_NAME}" | cut -d'@' -f 2)
REBUILD_DIGEST=$(echo "${REBUILT_IMAGE_NAME}" | cut -d'@' -f 2)

if [ "${ORIGINAL_DIGEST}" = "${REBUILD_DIGEST}" ]; then
  echo "The image build was reproducible!"
  exit 0
else
  echo "got: ${REBUILD_DIGEST}, wanted: ${ORIGINAL_DIGEST}"

  echo "Locked configuration:"
  cat "${TMP}" | jq -c .

  echo Config diff:
  diff <(crane config ${IMAGE_NAME} | jq) <(docker run --rm --link "registry-${FREE_PORT}.local" cgr.dev/chainguard/crane config ${REBUILT_IMAGE_NAME} | jq) || true

  echo Filesystem diff:
  diff -w <(crane export ${IMAGE_NAME} - | tar -tvf - | sort) <(docker run --rm --link "registry-${FREE_PORT}.local" cgr.dev/chainguard/crane export ${REBUILT_IMAGE_NAME} - | tar -tvf - | sort) || true

  exit 1
fi
