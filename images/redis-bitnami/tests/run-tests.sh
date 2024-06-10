#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Looks for these log statements in the pod logs
expected_logs=(
  "Server initialized"
  "Ready to accept connections"
)

missing_logs=()

TEST_validate_container_logs() {
  local logs=$(kubectl logs redis-node-0 -n redis 2>&1)
  local all_logs_found=true

  # Search the container logs for our expected log lines.
  for log in "${expected_logs[@]}"; do
    if ! echo "$logs" | grep -Fq "$log"; then
      all_logs_found=false
    fi
  done

  if $all_logs_found; then
    return 0
  fi

  for log in "${expected_logs[@]}"; do
    if ! echo "${logs}" | grep -Fq "$log"; then
      missing_logs+=("${log}")
    fi
  done

  echo "FAILED: The following log lines where not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

TEST_validate_container_logs
