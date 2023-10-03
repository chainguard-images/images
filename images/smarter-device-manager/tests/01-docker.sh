#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Set the name of the image if needed
if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# Mock a directory expected when the container runs in k8s.
DEVICE_PLUGINS_DIR=/tmp/device-plugins
  
start_detached_container() {
  docker run \
    --detach --rm \
    -v ${DEVICE_PLUGINS_DIR}:/var/lib/kubelet/device-plugins \
    "${IMAGE_NAME}"
}

TEST_starts_ok() {
  local -r container_id=$(start_detached_container)
  trap "docker stop ${container_id}" EXIT

  local elapsed_time=0
  local interval_secs=5
  local max_time_secs=60
  
  while [ $elapsed_time -lt $max_time_secs ]; do
    local logs=$(docker logs "${container_id}" 2>&1)
    if echo "$logs" | grep -q "ERROR"; then
      echo "Error detected within $elapsed_time seconds!"
      echo "Error logs:"
      echo "$logs" | grep "ERROR"
      docker stop "${container_id}"
      exit 1
    fi
    sleep $interval_secs
    elapsed_time=$((elapsed_time + interval_secs))
  done
}

TEST_starts_ok
