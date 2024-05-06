#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Random port is needed in multi-image test environments
PORT=$(shuf -i 1024-65535 -n 1)
CONTAINER_NAME="mlflow-${PORT}"

# Start MLflow Tracker
docker run \
  -d --rm \
  -v ./tmp/tests:/tmp/tests \
  -p "${PORT}":"${PORT}" \
  --name "${CONTAINER_NAME}" \
  --entrypoint mlflow \
  "${IMAGE_NAME}" \
  ui --host 0.0.0.0 -p "${PORT}"

# Stop container when script exits
trap "docker logs "${CONTAINER_NAME}" && docker stop ${CONTAINER_NAME}" EXIT

# Check MLflow Tracker availability
check_ui_status() {
  local request_retries=10
  local retry_delay=5

  # Install curl
  apk add curl

  # Check availability
  for ((i=1; i<=${request_retries}; i++)); do
    if [ "$(docker run --network container:"${CONTAINER_NAME}" cgr.dev/chainguard/curl:latest -o /dev/null -s -w "%{http_code}" "http://localhost:${PORT}/health")" -eq 200 ]; then
      return 0
    fi
    sleep "${retry_delay}"
  done

  echo "FAILED: Did not receive 200 HTTP response from Tracker after ${request_retries} attempts."
  exit 1
}

# Run tests
check_ui_status
