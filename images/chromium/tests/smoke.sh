#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CHROME_CONTAINER_NAME="chromium-$(uuidgen)"
CHROMEDRIVER_CONTAINER_NAME="chromedriver-$(uuidgen)"
CHROMEDRIVER_PORT="${FREE_PORT}"

# Check status
docker run \
  --rm \
  --platform linux/x86_64 \
  --name "${CHROME_CONTAINER_NAME}" \
  "${IMAGE_NAME}" \
  --dump-dom \
  https://www.chromestatus.com

# Test ChromeDriver starts successfully
docker run \
  --rm \
  --platform linux/x86_64 \
  --entrypoint chromedriver \
  -p "${CHROMEDRIVER_PORT}:${CHROMEDRIVER_PORT}" \
  --name "${CHROMEDRIVER_CONTAINER_NAME}" \
  "${IMAGE_NAME}" \
  --port "${CHROMEDRIVER_PORT}"

# Stop container when script exits
#trap "docker stop ${CHROMEDRIVER_CONTAINER_NAME}" EXIT

# Ensure assigned port is in use
#if ! curl -vsL --retry-all-errors --retry 5 --retry-max-time 30 localhost:"${CHROMEDRIVER_PORT}"; then
#  if [[ "$?" -eq "56" ]]; then
#    echo "ChromeDriver failed to start on port ${CHROMEDRIVER_PORT}."
#    exit 1
#  fi
#fi

# Retrieve container logs
logs=$(docker logs "${CHROMEDRIVER_CONTAINER_NAME}" 2>&1)

# Ensure ChromeDriver started successfully
expected_logs=("ChromeDriver was started successfully.")

for log in "${expected_logs[@]}"; do
  if ! echo "$logs" | grep -q "$log"; then
    echo "ChromeDriver failed to start."
    exit 1
  fi
done
