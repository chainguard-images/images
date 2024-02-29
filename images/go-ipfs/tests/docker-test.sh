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
  # create a volume for ipfs
  docker run \
    --rm -t \
    -v ipfs-data:/home/nonroot/.ipfs \
    cgr.dev/chainguard/bash \
    'chown nonroot:nonroot /home/nonroot/.ipfs'

  # set up ipfs
  docker run --rm -t -v ipfs-data:/home/nonroot/.ipfs ${IMAGE_NAME} init || true

  container_id=$(docker run \
    -v ipfs-data:/home/nonroot/.ipfs \
    -v /tmp:/export \
    -d --rm \
    -p "${CONTAINER_PORT}:5001" \
    --name "${CONTAINER_NAME}" \
    "${IMAGE_NAME}" daemon --migrate=true)

  trap "docker stop ${container_id}; docker volume rm ipfs-data" EXIT
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
    local logs=$(docker logs "${CONTAINER_NAME}")
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

 echo "Hello, IPFS!" > "/tmp/ipfs-test.txt"
 docker cp /tmp/ipfs-test.txt ${CONTAINER_NAME}:/tmp/ipfs-test.txt
 docker exec "${CONTAINER_NAME}" ipfs add /tmp/ipfs-test.txt

 RETRIEVED_FILE=${docker exec "${CONTAINER_NAME}" ipfs cat "/tmp/ipfs-test.txt"}
 LOCAL_FILE=$(cat /tmp/ipfs-test.txt)

 trap 'rm -rf /tmp/ipfs-test.txt' 
 exit 1

 if [ "${RETRIEVED_FILE}" != "${LOCAL_FILE}" ]; then
    echo "Failed: Unable to retrieve file from IPFS."
    exit 1
 fi
}

TEST_start_container
TEST_validate_container_logs
TEST_ipfs_functionality