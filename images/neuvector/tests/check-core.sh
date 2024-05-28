#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Parameters
NAMESPACE="neuvector"
RELEASE_NAME="core"

NV_PORT=""

REQUEST_RETRIES=15
RETRY_DELAY=20

declare -a expected_logs=(
  ""
)
declare -a missing_logs=()

# Port-forward NeuVector
kubectl port-forward svc/"${RELEASE_NAME}-manager" "${PORTAL_PORT}":80 --namespace "${NAMESPACE}" &
PF_PID=$!

# Cleanup function to stop port-forwarding on exit
function cleanup {
  echo "Cleaning up..."
  kill "${PF_PID}"
}
trap cleanup EXIT

# Validate NeuVector pod logs
TEST_validate_pod_logs() {
  local logs=$(kubectl logs -l app=neuvector -n "${NAMESPACE}" --all-containers --ignore-errors)
  local logs_found=true

  # Search the pod logs for our expected log lines
  for log in "${expected_logs[@]}"; do
    if ! echo "$logs" | grep -Fq "$log"; then
      logs_found=false
    fi
  done

  if $logs_found; then
    return 0
  fi

  # Record missing logs
  for log in "${expected_logs[@]}"; do
    if ! echo "${logs}" | grep -Fq "$log"; then
      missing_logs+=("${log}")
    fi
  done

  echo "FAILED: The following log lines were not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

# Verify NeuVector responds with a 200 HTTP status code
TEST_http_response() {
  # Install curl
  apk add curl

  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    if [ "$(curl -o /dev/null -s -w "%{http_code}" "http://localhost:${NV_PORT}")" -eq 200 ]; then
      return 0
    fi
    sleep "${RETRY_DELAY}"
  done

  echo "FAILED: Did not receive 200 HTTP response from portal after ${REQUEST_RETRIES} attempts."
  exit 1
}

# Test NeuVector core
TEST_core() {
}

TEST_validate_pod_logs
TEST_http_response
TEST_core
