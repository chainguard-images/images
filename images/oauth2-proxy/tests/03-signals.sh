#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

start_detached() {
  # cookie-secret: Randomly generated (head -c32 /dev/urandom | base64), required by API but no functional utility here
  # redirect-url: Oauth application's callback url
  # upstream-file: Target of redirect
  docker run --detach -p ${FREE_PORT}:${FREE_PORT} "${IMAGE_NAME}" \
    --cookie-secure=false \
    --cookie-secret=RYC2VBUYWQ6aenOkoN6jELQsrjtmwb23a7NdtrLI0ao= \
    --upstream=file:///dev/null \
    --http-address=0.0.0.0:${FREE_PORT} \
    --redirect-url=http://localhost:${FREE_PORT}/oauth2/callback \
    --client-id=dummy-id \
    --client-secret=dummy-secret \
    --email-domain="*" \
    --provider=github \
    --scope=user:email
  sleep 2
}

TEST_kill_signal() {
  local -r signal="${1}"

  echo "${signal} Testing"
  local -r container_id=$(start_detached)

  # Attempt to kill the container with the specified signal
  docker kill "${container_id}" --signal "${signal}"

  # Wait for the container to die
  sleep 5

  # Check if container is still running
  # NOTE: The `grep` needs to be inside the conditional so it doesn't fail the
  #       script due to the `-o pipefail`
  if [ "$(docker ps --no-trunc | grep "${container_id}" | wc -l)" -ne "0" ]; then
    docker ps --no-trunc
    echo "${signal} Failed"
    exit 1;
  fi
  echo "${signal} Success"
}

TEST_kill_signal "SIGTERM"
TEST_kill_signal "SIGKILL"
