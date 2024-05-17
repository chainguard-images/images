#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NIFI_PORT=$(shuf -i 1024-65535 -n 1)
CONTAINER_NAME="nifi-${NIFI_PORT}"

# User credentials
USERNAME="admin"
PASSWD="ctsBtRBKHRAx69EqUghvvgEvjnaLjFEB"

# Retries
REQUEST_RETRIES=10
RETRY_DELAY=5

# Logs
declare -a expected_logs=(
  "Starting Apache NiFi"
  "NiFi running with PID"
  "Launched Apache NiFi with Process ID"
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

# Validate that NiFi container logs contain expected log messages.
TEST_validate_container_logs() {
  apk add grep

  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    local logs=$(docker logs "${CONTAINER_NAME}" 2>&1)
    local logs_found=true

    # Search the container logs for our expected log lines.
    for log in "${expected_logs[@]}"; do
      if ! echo "$logs" | /usr/bin/grep -Fq "$log"; then
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
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    if $(docker run --network container:"${CONTAINER_NAME}" cgr.dev/chainguard/curl -vsL "http://localhost:${NIFI_PORT}/nifi"); then
      return 0 
    fi
    sleep ${RETRY_DELAY}
  done

  echo "FAILED: Did not receive 200 HTTP response from portal after ${REQUEST_RETRIES} attempts."
  exit 1
}

# Run tests
TEST_validate_container_logs
TEST_http_response
