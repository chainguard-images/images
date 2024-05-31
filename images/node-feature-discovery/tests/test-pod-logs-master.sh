#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Looks for these log statements in the pod logs
expected_logs=(
  "starting the nfd api controller"
  "starting the NFD master updater pool"
  "will process all nodes in the cluster"
)

missing_logs=()

RETRIES=5
RETRY_DELAY_SECONDS=15
DEPLOYMENT_NAME="${K8S_NAME}-master"

TEST_validate_container_logs() {
  for ((i=1; i<=${RETRIES}; i++)); do
    local logs=$(kubectl logs "deploy/${DEPLOYMENT_NAME}" -n "${K8S_NAMESPACE}" 2>&1)
    local logs_found=true

    # Search the container logs for our expected log lines.
    for log in "${expected_logs[@]}"; do
      if ! echo "$logs" | grep -Fq "$log"; then
        logs_found=false
      fi
    done

    if $logs_found; then
      return 0
    elif [[ $i -lt ${RETRIES} ]]; then
      echo "Some expected logs were missing. Retrying in ${RETRY_DELAY_SECONDS} seconds..."
      sleep ${RETRY_DELAY_SECONDS}
    fi
  done

  # After all retries, record the missing logs
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
