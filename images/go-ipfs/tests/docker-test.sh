#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="ipfs-host-$(uuidgen)"
CONTAINER_PORT=${FREE_PORT}
REQUEST_RETRIES=5
RETRY_DELAY=15

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Log entries which we expect to be present when the service is running healthy.
expected_logs=(
  "Daemon is ready"
)

missing_logs=()

# Start up a new IPFS container
TEST_start_container() {
  container_id=$(docker run \
    -d --rm \
    --name "${CONTAINER_NAME}" -p "${CONTAINER_PORT}:5001" \
    ipfs/kubo:latest)

  trap "docker stop ${container_id}" EXIT
  sleep 15
  
  if ! docker ps --filter "name=${CONTAINER_NAME}" --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "FAILED: ${CONTAINER_NAME} is not running."
    exit 1
  fi
}

# Validate the container is running and healthy by looking for known, good,
# expected log entries.
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

# Validate the IPFS functionality by adding and retrieving a file
TEST_ipfs_functionality() {
 echo "Hello, IPFS!" > "${ipfs_staging}/test.txt"
 docker exec "${CONTAINER_NAME}" ipfs add "${ipfs_staging}/test.txt"
 
 FILE_HASH=$(docker exec "${CONTAINER_NAME}" ipfs add -r "/export/test.txt" | tail -n1 | awk '{print $2}')
 RETRIEVED_FILE=${docker exec "${CONTAINER_NAME}" ipfs cat "${FILE_HASH}"}

 if [ "${RETRIEVED_FILE}" != "Hello, IPFS!" ]; then
    echo "Failed: Unable to retrieve file from IPFS."
    exit 1
 fi
}

TEST_start_container
TEST_validate_container_logs
TEST_ipfs_functionality