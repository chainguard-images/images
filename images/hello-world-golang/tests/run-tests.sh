#!/usr/bin/env bash

# A simple test which runs the container, and performs log validation to ensure
# the service is running as expected.

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="hello-world-golang-$(uuidgen)"

REQUEST_RETRIES=10
RETRY_DELAY=15

expected_logs=(
  "hello world"
  "random word:"
  "iteration 1"
  "iteration 2"
)
missing_logs=()

TEST_start_container() {
  container_id=$(docker run \
    --detach --rm \
    --name "${CONTAINER_NAME}" \
    "${IMAGE_NAME}")
    
  trap "docker stop ${container_id}" EXIT
  sleep 15
  
  if ! docker ps --filter "name=${CONTAINER_NAME}" --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "FAILED: ${CONTAINER_NAME} is not running."
    exit 1
  fi
}

TEST_validate_container_logs() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    local logs=$(docker logs "${container_id}" 2>&1)
    local logs_found=true

    # Search the container logs for our expected log lines.
    for log in "${expected_logs[@]}"; do
      if ! echo "$logs" | grep -Fq "$log"; then
        logs_found=false
      fi
    done

    if $logs_found; then
      return 0
    elif [[ $i -lt ${REQUEST_RETRIES} ]]; then
      echo "Some expected logs were missing. Retrying in ${RETRY_DELAY} seconds..."
      sleep ${RETRY_DELAY}
    fi
  done

  # After all retries, record the missing logs
  for log in "${expected_logs[@]}"; do
    if ! echo "${logs}" | grep -Fq "$log"; then
      missing_logs+=("${log}")
    fi
  done

  echo "FAILED: The following log lines where not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

TEST_start_container
TEST_validate_container_logs
