#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

K8S_NAME="${1}"
K8S_NAMESPACE="alertmanager"

# Log entries which we expect to be present when the service is running healthy.
expected_logs=(
  "Completed loading of configuration file"
  "Listening on"
)

missing_logs=()

# Validate the container is running and healthy by looking for known, good,
# expected log entries.
TEST_validate_container_logs() {
  local logs=$(kubectl logs -n ${K8S_NAMESPACE} statefulset/${K8S_NAME} 2>&1)
  local logs_found=true

  # Search the container logs for our expected log lines.
  for log in "${expected_logs[@]}"; do
    if ! echo "$logs" | grep -Fq "$log"; then
      logs_found=false
    fi
  done

  if $logs_found; then
    return 0
  else
    echo "Some expected logs were missing."
  fi

  # Record missing logs
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
  kubectl port-forward -n ${K8S_NAME} service/${K8S_NAME} 9093:9093 --pod-running-timeout=30s &
  sleep 5
  local response=$(
    curl -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
    "http://localhost:9093/api/v2/status"
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

TEST_validate_container_logs
TEST_api_request
