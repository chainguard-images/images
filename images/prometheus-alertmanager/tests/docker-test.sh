#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="alertmanager-$(uuidgen)"
CONTAINER_PORT=${FREE_PORT}

REQUEST_RETRIES=5
RETRY_DELAY=15

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Log entries which we expect to be present when the service is running healthy.
expected_logs=(
  "Completed loading of configuration file"
  "Listening on"
)

missing_logs=()

# Start up a new alertmanager container, and volume-mounts an example
# configuration file.
TEST_start_container() {
  container_id=$(docker run \
    -d --rm \
    --name "${CONTAINER_NAME}" -p "${CONTAINER_PORT}:9093" \
    -v "${SCRIPT_DIR}/alertmanager-config.yml:/etc/alertmanager/alertmanager.yml" \
    "${IMAGE_NAME}")

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

# Validate the alertmanager API is operational, and returns correct data.
TEST_api_request() {
  local response=$(
    curl -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
    "http://localhost:${CONTAINER_PORT}/api/v2/status"
  )

  local response_code=$(echo "${response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
  local content=$(echo "${response}" | sed '/HTTP_STATUS_CODE/d')

  if [[ "${response_code}" == "200" ]]; then
    # In 'alertmanager-config.yml', we provided custom configuration and provided
    # a placeholder pagerDuty URL. We are check that the API returns the same URL
    # in it's response.
    if echo "${content}" | grep -q "pagerduty_url: https://example-pagerduty.com/v2/test"; then
      echo "SUCCESS: Expected PagerDuty URL was found in API response"
    else
      echo "ERROR: Expected PagerDuty URL was not returned in the Alertmanager API response"
      return 1
    fi
  else
    echo "ERROR: Alertmanager API returned an error response code: ${response_code}"
    return 1
  fi
}

TEST_start_container
TEST_validate_container_logs
TEST_api_request
