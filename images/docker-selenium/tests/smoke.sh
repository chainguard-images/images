#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="docker-selenium-$(uuidgen)"

SELENIUM_PORT="${FREE_PORT}"
NO_VNC_PORT="$((${SELENIUM_PORT} + 1))"
VNC_PORT="$((${NO_VNC_PORT} + 1))"

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

echo "Checking noVNC availability..."
nc -zv localhost "${NO_VNC_PORT}"

# netcat may succeed but the noVNC page may not be available
if ! curl -vsL --retry-all-errors --retry 2 --retry-max-time 10 localhost:"${NO_VNC_PORT}"; then
  if [[ "$?" -eq "56" ]]; then
    exit 1
  fi
fi

# Check if container is still running
if ! docker ps --filter "name=${CONTAINER_NAME}" --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "FAILED: ${CONTAINER_NAME} is not running."
  exit 1
fi

function dump_logs_and_exit {
  echo "Dumping supervisor logs and exiting..."
  supervisor_logs=$(docker exec "${CONTAINER_NAME}" ls /var/log/supervisor)
  for log in ${supervisor_logs}; do
    echo "Dumping supervisor log: ${log}"
    docker exec "${CONTAINER_NAME}" cat "/var/log/supervisor/${log}" || true
  done
  container_logs=$(docker logs "${CONTAINER_NAME}")
  echo "Dumping container logs: ${container_logs}"
  exit 1
}

logs=$(docker logs "${CONTAINER_NAME}" 2>&1)

# Services that started by supervisor should have entered RUNNING state
true_asserts=("xvfb entered RUNNING state" "vnc entered RUNNING state" "novnc entered RUNNING state" "selenium-standalone entered RUNNING state")

# Services that started by supervisor should NOT have exited unexpectedly
false_asserts=("WARN exited" "terminated by SIGTRAP", "not expected")

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

echo "All assertions passed."
