#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

# Default APKO image used to rebuild for reproducibility checks.
# Update this with the latest APKO once it is rebuilt.
# Note: APKO_IMAGE is only a variable so that it can be overridden when
# the tf-apko version is being overridden using developer overrides.
: "${APKO_IMAGE:=ghcr.io/wolfi-dev/apko:latest@sha256:069485cbaedcd303d1ad304dc09d7bb5a7d87a8e60de1a80b74305b40d0400d3}"
: "${IMAGE_NAME:?IMAGE_NAME must be set to the published image ref to compare against}"
: "${APKO_CONFIG_JSON:?APKO_CONFIG_JSON must be set to the locked apko config (JSON)}"

APKO_CONFIG=$(mktemp -t apko-config.XXXXXX)
# .localhost, not .local: ggcr only treats .localhost as insecure/HTTP since google/go-containerregistry#2281.
container_name="registry-$(hexdump -vn16 -e'4/4 "%08x" 1 "\n"' /dev/urandom).localhost"

# shellcheck disable=SC2064 # Intentional: expand names now, they won't change.
trap "rm -f '${APKO_CONFIG}'; docker rm -f ${container_name} >/dev/null 2>&1 || true" EXIT

printf '%s' "${APKO_CONFIG_JSON}" > "${APKO_CONFIG}"

docker run -d --name "${container_name}" cgr.dev/chainguard/crane registry serve --address 0.0.0.0:5000 --disk /tmp

# Mount the host's APK cache into the container to improve performance
# and avoid reliability problems due to refetching APKs we already have
# on the host.
REBUILT_IMAGE_NAME=$(docker run --rm \
   --link "${container_name}" \
   --user "$(id -u):$(id -g)" \
   -v "${APKO_CONFIG}:/tmp/latest.apko.json:ro" \
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
  jq -c . "${APKO_CONFIG}"

  echo Config diff:
  diff <(crane config ${IMAGE_NAME} | jq) <(docker run --rm --link "${container_name}" cgr.dev/chainguard/crane --insecure config ${REBUILT_IMAGE_NAME} | jq) || true

  echo Filesystem diff:
  diff -w <(crane export ${IMAGE_NAME} - | tar -tvf - | sort) <(docker run --rm --link "${container_name}" cgr.dev/chainguard/crane --insecure export ${REBUILT_IMAGE_NAME} - | tar -tvf - | sort) || true

  echo "etc/apko.json diff:"
  diff <(crane export ${IMAGE_NAME} - | tar -Oxf - etc/apko.json | jq) <(docker run --rm --link "${container_name}" cgr.dev/chainguard/crane --insecure export ${REBUILT_IMAGE_NAME} - | tar -Oxf - etc/apko.json | jq) || true

  exit 1
fi
