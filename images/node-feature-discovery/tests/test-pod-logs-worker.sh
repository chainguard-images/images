#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Looks for these log statements in the pod logs
expected_logs=(
  "starting feature discovery..."
  "feature discovery completed"
)

missing_logs=()

DEPLOYMENT_NAME="${K8S_NAME}-worker"

TEST_validate_container_logs() {
  local logs=$(kubectl logs "ds/${DEPLOYMENT_NAME}" -n "${K8S_NAMESPACE}" 2>&1)
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
