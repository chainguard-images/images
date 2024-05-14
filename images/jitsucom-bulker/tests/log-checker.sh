#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# First argument: Kubernetes deployment name
K8S_NAME="$1"

# Second argument: String of expected logs separated by '|'
input_logs="$2"

# Split the input string into an array using '|' as delimiter
IFS='|' read -r -a expected_logs <<< "$input_logs"

missing_logs=()

RETRIES=5
RETRY_DELAY_SECONDS=15

TEST_validate_container_logs() {
  for ((i=1; i<=${RETRIES}; i++)); do
    local logs=$(kubectl logs "deploy/${K8S_NAME}" -n "${K8S_NAMESPACE}" 2>&1)
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
  echo "Full logs:"
  kubectl logs "deploy/${K8S_NAME}" -n "${K8S_NAMESPACE}"
  exit 1
}

TEST_validate_container_logs
