#!/usr/bin/env bash

# Note: requires helm

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CONTAINER_NAME=${CONTAINER_NAME:-"chartmuseum-test-$(date +%s)"}

TMPDIR="$(mktemp -d)"
trap "rm -rf ${TMPDIR} && \
  docker logs ${CONTAINER_NAME} && \
  docker rm -f ${CONTAINER_NAME}" EXIT
cd "${TMPDIR}"

# Ensure fresh helm cache etc.
export XDG_CACHE_HOME="${PWD}/home/.cache"
export XDG_CONFIG_HOME="${PWD}/home/.config"
export XDG_DATA_HOME="${PWD}/home/.local/share"
mkdir -p "${XDG_CACHE_HOME}" "${XDG_CONFIG_HOME}" "${XDG_DATA_HOME}"

# Create and package a helm chart
helm create smoketest
mkdir -p charts
helm package smoketest -d charts

# Start the chartmuseum server, grab container IP
docker run -d --name "${CONTAINER_NAME}" \
  -p 8080:8080 -v "${PWD}/charts":/charts "${IMAGE_NAME}"
sleep 2

# Try adding the running chartmuseum server as a helm repo
helm repo add chartmuseum http://localhost:8080

# Make sure we can find the smoketest package
helm search repo | grep 'chartmuseum/smoketest'
