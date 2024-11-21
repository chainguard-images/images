#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NIFI_PORT=$(shuf -i 1024-65535 -n 1)
CONTAINER_NAME="nifi-${NIFI_PORT}"

# User credentials
USERNAME="admin"
PASSWD="ctsBtRBKHRAx69EqUghvvgEvjnaLjFEB"

# Logs
declare -a expected_logs=(
  "org.apache.nifi.runtime.Application Starting NiFi"
  "NiFi running with PID"
  "org.apache.nifi.py4j.Controller Listening for requests from Java side using Python Port"
  "org.apache.nifi.web.server.JettyServer Started Server on"
  "o.a.n.runtime.StandardManagementServer Started Management Server on"
  "org.apache.nifi.runtime.Application Started Application"
)
declare -a missing_logs=()

# Run NiFi
docker run \
  -d --rm \
  -p "${NIFI_PORT}":"${NIFI_PORT}" \
  -e NIFI_WEB_HTTPS_HOST="0.0.0.0" \
  -e NIFI_WEB_HTTPS_PORT="${NIFI_PORT}" \
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
  local retry_delay=10

  for ((i=1; i<=${request_retries}; i++)); do
    if [[ $(curl --insecure --silent --location --output /dev/null -w "%{http_code}" "https://localhost:${NIFI_PORT}/nifi") -eq 200 ]]; then
      return 0
    fi
    sleep ${retry_delay}
  done

  echo "FAILED: Did not receive 200 HTTP response from portal after ${request_retries} attempts."
  exit 1
}

# Tests API by creating a processor in the root process group
TEST_create_processor() {
  # apk add jq
  # Get API access token
  local access_token=$(curl --silent --insecure --request POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=${USERNAME}&password=${PASSWD}" \
  "https://localhost:${NIFI_PORT}/nifi-api/access/token")

  # Fetch root process group
  local pg=$(curl --insecure --silent --request GET --header "Authorization: Bearer ${access_token}" \
            "https://localhost:${NIFI_PORT}/nifi-api/flow/process-groups/root")
  printf "Root process group:\n${pg}"

  # Extract root process group ID
  local pg_id=$(echo "${pg}" | jq --raw-output '.processGroupFlow.id')
  echo "Root process group ID: ${pg_id}"

  # Create a processor
  local create_processor=$(\
    curl --insecure --silent --write-out "%{http_code}" \
       --request POST \
       --header "Authorization: Bearer ${access_token}" \
       "https://localhost:${NIFI_PORT}/nifi-api/process-groups/${pg_id}/processors" \
       --header "Content-Type: application/json" \
       --data '{
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
  local processor_id=$(echo "${processor}" | jq --raw-output '.component.id')
  echo "Processor ID: ${processor_id}"

  # Fetch processor info
  local processor_info=$(curl --insecure --silent --request GET --header "Authorization: Bearer ${access_token}" "https://localhost:${NIFI_PORT}/nifi-api/processors/${processor_id}")
  printf "Processor info:\n${processor_info}"
}

# Run tests
TEST_http_response
# Sleep 5 seconds to ensure that all services start. In my testing this is more than enough time.
sleep 5
TEST_validate_container_logs
TEST_create_processor
