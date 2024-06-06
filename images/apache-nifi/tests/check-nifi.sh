#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NIFI_PORT=$(shuf -i 1024-65535 -n 1)
CONTAINER_NAME="nifi-${NIFI_PORT}"

# User credentials
USERNAME="admin"
PASSWD="ctsBtRBKHRAx69EqUghvvgEvjnaLjFEB"

# Logs
declare -a expected_logs=(
  "Starting Apache NiFi"
  "NiFi running with PID"
  "Launched Apache NiFi with Process ID"
  "NiFi has started"
  "The UI is available at the following URLs"
)
declare -a missing_logs=()

# Run NiFi
docker run \
  -d --rm \
  -p "${NIFI_PORT}":"${NIFI_PORT}" \
  -e NIFI_WEB_HTTP_HOST="0.0.0.0" \
  -e NIFI_WEB_HTTP_PORT="${NIFI_PORT}" \
  -e SINGLE_USER_CREDENTIALS_USERNAME="${USERNAME}" \
  -e SINGLE_USER_CREDENTIALS_PASSWORD="${PASSWD}" \
  --name "${CONTAINER_NAME}" \
  "${IMAGE_NAME}"

# Stop container when script exits
trap "docker stop ${CONTAINER_NAME}" EXIT

# Use curl container
curl() {
  docker run --network container:"${CONTAINER_NAME}" cgr.dev/chainguard/curl "$@"
}

# Validate that NiFi container logs contain expected log messages.
TEST_validate_container_logs() {
  apk add grep

  local logs=$(docker logs "${CONTAINER_NAME}" 2>&1)
  local logs_found=true

  # Search the container logs for our expected log lines.
  for log in "${expected_logs[@]}"; do
    if echo "$logs" | /usr/bin/grep -qvz "$log"; then
      logs_found=false
    fi
  done

  if $logs_found; then
    return 0
  fi

  # After all retries, record the missing logs
  for log in "${expected_logs[@]}"; do
    if ! echo "${logs}" | /usr/bin/grep -Fq "$log"; then
      missing_logs+=("${log}")
    fi
  done

  echo "FAILED: The following log lines were not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

# Check that NiFi portal responds 200 HTTP status code indicating it's operational.
TEST_http_response() {
  # Retries
  local request_retries=15
  local retry_delay=5

  for ((i=1; i<=${request_retries}; i++)); do
    if [[ $(curl -sLo /dev/null -w "%{http_code}" "http://localhost:${NIFI_PORT}/nifi") -eq 200 ]]; then
      return 0
    fi
    sleep ${retry_delay}
  done

  echo "FAILED: Did not receive 200 HTTP response from portal after ${request_retries} attempts."
  exit 1
}

# Tests API by creating a processor in the root process group
TEST_create_processor() {
  apk add jq

  # Fetch root process group
  local pg=$(curl -s -X GET "http://localhost:${NIFI_PORT}/nifi-api/flow/process-groups/root")
  printf "Root process group:\n${pg}"

  # Extract root process group ID
  local pg_id=$(echo "${pg}" | jq -r '.processGroupFlow.id')
  echo "Root process group ID: ${pg_id}"

  # Create a processor
  local create_processor=$(\
    curl -s -w "%{http_code}" \
       -X POST "http://localhost:${NIFI_PORT}/nifi-api/process-groups/${pg_id}/processors" \
       -H "Content-Type: application/json" \
       -d '{
            "revision": {
              "clientId": "test-client",
              "version": 0
            },
            "component": {
              "type": "org.apache.nifi.processors.standard.GenerateFlowFile",
              "name": "GenerateFlowFile"
            }
          }' | jq \
  )

  # Validate creation was successful
  local http_code=$(echo "${create_processor}" | tail -n1)
  if [[ "${http_code}" -eq 201 ]]; then
    echo "Processor created successfully!"
  else
    echo "Failed to create processor!"
    exit 1
  fi

  # Fetch processor ID
  local processor=$(echo "${create_processor}" | sed "s/${http_code}//")
  local processor_id=$(echo "${processor}" | jq -r '.component.id')
  echo "Processor ID: ${processor_id}"

  # Fetch processor info
  local processor_info=$(curl -s -X GET "http://localhost:${NIFI_PORT}/nifi-api/processors/${processor_id}")
  printf "Processor info:\n${processor_info}"
}

# Run tests
TEST_http_response
TEST_validate_container_logs
TEST_create_processor
