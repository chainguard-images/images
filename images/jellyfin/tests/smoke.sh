#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="jellyfin-$(uuidgen)"
JELLYFIN_PORT="${FREE_PORT}"

# Start container
docker run \
  -d --rm \
  -p "${JELLYFIN_PORT}":8096 \
  --name "${CONTAINER_NAME}" \
  "${IMAGE_NAME}"

# Stop container when script exits
trap "docker stop ${CONTAINER_NAME}" EXIT
sleep 5

# Verify Jellyfin is available
if ! curl --fail http://localhost:"${JELLYFIN_PORT}"/health; then
  # Check if container is still running
  if ! docker ps --filter "name=${CONTAINER_NAME}" --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "FAILED: ${CONTAINER_NAME} is not running."
  fi
  exit 1
fi
