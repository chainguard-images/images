#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add uuidgen curl jq netcat-openbsd

CONTAINER_NAME="docker-selenium-$(uuidgen)"

SELENIUM_PORT="4444"
NO_VNC_PORT="7900"
VNC_PORT="5900"

# Start container
docker run \
  -d --rm \
  -p "${SELENIUM_PORT}":4444 \
  -p "${NO_VNC_PORT}":7900 \
  -p "${VNC_PORT}":5900 \
  -e "SE_NO_VNC_PORT=${NO_VNC_PORT}" \
  -e "SE_VNC_PORT=${VNC_PORT}" \
  --platform linux/x86_64 \
  --name "${CONTAINER_NAME}" \
  "${IMAGE_NAME}"

# Stop container when script exits
trap "docker stop ${CONTAINER_NAME}" EXIT

# Use curl container
curl() {
  docker run --network container:"${CONTAINER_NAME}" cgr.dev/chainguard/curl "$@"
}

# Function to dump logs and exit
function dump_logs_and_exit {
  echo "Dumping logs before exiting..."
  docker logs "${CONTAINER_NAME}"
  supervisor_logs=$(docker exec "${CONTAINER_NAME}" ls /var/log/supervisor || true)
  for log in ${supervisor_logs}; do
    docker exec "${CONTAINER_NAME}" cat "/var/log/supervisor/${log}" || true
  done
  exit 1
}

# Wait for Selenium to initialize (extended wait with loop)
echo "Waiting for Selenium to be ready..."
echo "Giving Selenium container a moment to start..."
sleep 10

echo "Waiting for Selenium to be ready with exponential backoff..."
max_retries=10
retry_count=0
delay=5

# Verify services are available
echo "Checking if Selenium is ready..."
if ! curl -vsL --retry-all-errors --retry 10 --retry-max-time 120 http://localhost:"${SELENIUM_PORT}"/status | jq -e '.value.ready == true'; then
  # Check if container is still running
  if ! docker ps --filter "name=${CONTAINER_NAME}" --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "FAILED: ${CONTAINER_NAME} is not running."
  fi
  exit 1
fi

echo "Checking if Selenium has 1 available node..."
curl -vsL http://localhost:"${SELENIUM_PORT}"/status | jq '.value.nodes | length == 1'
curl -vsL http://localhost:"${SELENIUM_PORT}"/status | jq '.value.nodes[0].avaibility == "UP"'

# Validate noVNC page
if ! curl -vsL --retry 2 --retry-max-time 10 http://localhost:"${NO_VNC_PORT}"; then
  echo "noVNC page is not available."
  dump_logs_and_exit
fi

# Check for expected log messages
logs=$(docker logs "${CONTAINER_NAME}" 2>&1)
true_asserts=("xvfb entered RUNNING state" "vnc entered RUNNING state" "novnc entered RUNNING state" "selenium-standalone entered RUNNING state")
false_asserts=("WARN exited" "terminated by SIGTRAP" "not expected")

for assert in "${true_asserts[@]}"; do
  if ! echo "$logs" | grep -q "$assert"; then
    echo "AssertTrue failed: $assert"
    dump_logs_and_exit
  fi
done

for assert in "${false_asserts[@]}"; do
  if echo "$logs" | grep -q "$assert"; then
    echo "AssertFalse failed: $assert"
    dump_logs_and_exit
  fi
done

echo "All checks passed successfully."
