#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CHROME_CONTAINER_NAME="chromium-$(uuidgen)"
CHROMEDRIVER_CONTAINER_NAME="chromedriver-$(uuidgen)"

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
  -d --rm \
  --platform linux/x86_64 \
  --entrypoint chromedriver \
  --name "${CHROMEDRIVER_CONTAINER_NAME}" \
  "${IMAGE_NAME}"

# Stop container when script exits
trap "docker stop ${CHROMEDRIVER_CONTAINER_NAME}" EXIT
sleep 5

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
