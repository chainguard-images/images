#!/usr/bin/env bash

# Note: requires helm

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"chartmuseum-test-${FREE_PORT}"}

TMPDIR="$(mktemp -d)"
trap "rm -rf ${TMPDIR} && \
  docker logs ${CONTAINER_NAME} && \
  docker rm -f ${CONTAINER_NAME}" EXIT
cd "${TMPDIR}"

# Ensure fresh helm cache etc.
HELM_XDG_CACHE_HOME="${PWD}/home/.cache"
HELM_XDG_CONFIG_HOME="${PWD}/home/.config"
HELM_XDG_DATA_HOME="${PWD}/home/.local/share"
mkdir -p "${HELM_XDG_CACHE_HOME}" "${HELM_XDG_CONFIG_HOME}" "${HELM_XDG_DATA_HOME}"

# The XDG config vars will mess with docker auth, so create custom helm env
function set_helm_env {
  export XDG_CACHE_HOME="${HELM_XDG_CACHE_HOME}"
  export XDG_CONFIG_HOME="${HELM_XDG_CONFIG_HOME}"
  export XDG_DATA_HOME="${HELM_XDG_CONFIG_HOME}"
}
function unset_helm_env {
  unset XDG_CACHE_HOME
  unset XDG_CONFIG_HOME
  unset XDG_DATA_HOME
}

# Create and package a helm chart
set_helm_env && helm create smoketest && unset_helm_env
mkdir -p charts
set_helm_env && helm package smoketest -d charts && unset_helm_env

# Start the chartmuseum server, grab container IP
docker run -d --name "${CONTAINER_NAME}" \
  -p ${FREE_PORT}:8080 -v "${PWD}/charts":/charts "${IMAGE_NAME}"
sleep 2

# Try adding the running chartmuseum server as a helm repo
set_helm_env && helm repo add chartmuseum http://localhost:${FREE_PORT} && unset_helm_env

# Make sure we can find the smoketest package
set_helm_env && helm search repo | grep 'chartmuseum/smoketest' && unset_helm_env
