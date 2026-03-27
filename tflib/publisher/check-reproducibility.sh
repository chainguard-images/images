#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

# Default APKO image used to rebuild for reproducibility checks.
# Update this with the latest APKO once it is rebuilt.
# Note: APKO_IMAGE is only a variable so that it can be overridden when
# the tf-apko version is being overridden using developer overrides.
: "${APKO_IMAGE:=ghcr.io/wolfi-dev/apko:latest@sha256:045f6a7ebadf2885785bd728b73644b69aca297bda762f2f78be9bb1fdc86e48}"

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

container_name="registry-$(hexdump -vn16 -e'4/4 "%08x" 1 "\n"' /dev/urandom).local"
docker run -d --name "${container_name}" cgr.dev/chainguard/crane registry serve --address 0.0.0.0:5000

trap "docker rm -f ${container_name}" EXIT

# Mount the host's APK cache into the container to improve performance
# and avoid reliability problems due to refetching APKs we already have
# on the host.
REBUILT_IMAGE_NAME=$(docker run --rm \
   --link "${container_name}" \
   --user $(id -u):$(id -g) \
   -v "${TMP}:/tmp/latest.apko.json" \
   -v ${PWD}:${PWD}:ro -w ${PWD} \
   -v ${XDG_CACHE_HOME:-$HOME/.cache}:/cache \
   -e XDG_CACHE_HOME=/cache \
   "${APKO_IMAGE}" \
   publish /tmp/latest.apko.json ${container_name}:5000/reproduction
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
  diff <(crane config ${IMAGE_NAME} | jq) <(docker run --rm --link "${container_name}" cgr.dev/chainguard/crane config ${REBUILT_IMAGE_NAME} | jq) || true

  echo Filesystem diff:
  diff -w <(crane export ${IMAGE_NAME} - | tar -tvf - | sort) <(docker run --rm --link "${container_name}" cgr.dev/chainguard/crane export ${REBUILT_IMAGE_NAME} - | tar -tvf - | sort) || true

  exit 1
fi
