#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Parameters
NAMESPACE="harbor"
RELEASE_NAME="harbor"

# Get Harbor portal's port
PORTAL_PORT=$(kubectl get svc --namespace "${NAMESPACE}" "${RELEASE_NAME}-portal" -o jsonpath='{.spec.ports[?(@.protocol=="TCP")].port}')

REQUEST_RETRIES=15
RETRY_DELAY=20

declare -a expected_logs=(
  "Server initialized"
  "Ready to accept connections"
  "Internal tls trust CA appending is Done"
  "API server is serving at"
  "\"GET /api/health HTTP/1.1\" 200"
)
declare -a missing_logs=()

# Port-forward the Harbor portal service
kubectl port-forward svc/"${RELEASE_NAME}-portal" "${PORTAL_PORT}":80 --namespace "${NAMESPACE}" &
PF_PID=$!

# Cleanup function to stop port-forwarding on exit
function cleanup {
  echo "Cleaning up..."
  kill "${PF_PID}"
}
trap cleanup EXIT

# Validate Harbor pod logs
TEST_validate_pod_logs() {
  local logs=$(kubectl logs -l app=harbor -n "${NAMESPACE}" --all-containers --ignore-errors)
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

# Verify Harbor portal responds with a 200 HTTP status code
TEST_http_response() {
  # Install curl
  apk add curl

  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    if [ "$(curl -o /dev/null -s -w "%{http_code}" "http://localhost:${PORTAL_PORT}")" -eq 200 ]; then
      return 0
    fi
    sleep "${RETRY_DELAY}"
  done

  echo "FAILED: Did not receive 200 HTTP response from portal after ${REQUEST_RETRIES} attempts."
  exit 1
}

# Push Wolfi to registry!
TEST_push_to_registry() {
  # Install Docker
  apk add docker

  # Login with default username and password
  docker login localhost:"${PORTAL_PORT}" --username admin --password Harbor12345

  # Enable this when the imagetest harness supports Docker

  # Pull Wolfi
  #docker pull cgr.dev/chainguard/wolfi-base:latest

  # Tag image for local registry
  #docker tag cgr.dev/chainguard/wolfi-base:latest localhost:"${PORTAL_PORT}"/library/wolfi-base:latest

  # Push Wolfi to local registry
  #docker push localhost:"${PORTAL_PORT}"/library/wolfi-base:latest
}

TEST_validate_pod_logs
TEST_http_response
TEST_push_to_registry
