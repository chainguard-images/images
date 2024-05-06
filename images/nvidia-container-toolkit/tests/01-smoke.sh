#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="nvidia-container-toolkit-$(uuidgen)"

# We expect the command to fail, but want its output anyway.
set +o pipefail

# $ROOT environment variable will be set by the `gpu-operator`. Pass an arbitrary value to test the script.
logs=$(docker run --rm --name "${CONTAINER_NAME}" -e ROOT="/work" "${IMAGE_NAME}" 2>&1) || true

sleep 3

function dump_logs_and_exit {
  echo "Dumping container logs: ${logs}"
  exit 1
}

# Services that started by supervisor should have entered RUNNING state
true_asserts=("Installing NVIDIA container toolkit config" "Setting up runtime" "Successfully parsed arguments")

# This image is intended to be run on a host with NVIDIA GPU drivers installed, so it prints out an error message
true_asserts+=("unable to dial: dial unix /var/run/docker.sock")

for assert in "${true_asserts[@]}"; do
  if ! echo "$logs" | grep -q "$assert"; then
    echo "AssertTrue failed: $assert"
    dump_logs_and_exit
  fi
done

echo "All assertions passed."
