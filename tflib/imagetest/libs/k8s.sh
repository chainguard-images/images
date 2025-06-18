#!/usr/bin/env bash

set -euo pipefail

print_debug() {
  echo "--------- LOGS BEGIN ---------"
  echo "$logs"
  echo "---------- LOGS END ----------"
}

ensure_pod_logs() {
  trap print_debug EXIT

  local pod_name="${1}"
  local namespace="${2:-default}"

  if (( ${#expected_logs[@]} == 0 )); then
  	echo >&2 "expected_logs is empty. source your expected_logs definition."
  	exit 1
  fi
  
  echo "Getting logs for pod: $POD_NAME"
  logs=$(kubectl logs "${pod_name}" -n "${namespace}")
  
  missing_logs=()
  
  for log in "${expected_logs[@]}"; do
    if ! grep -Fq "$log" <<< "$logs"; then
      missing_logs+=("$log")
    fi
  done
  
  if (( ${#missing_logs[@]} > 0 )); then
    echo "Error: the following expected log lines were not found:"
    printf '  - %s\n' "${missing_logs[@]}"
    exit 1
  else
    echo "All expected logs found."
    exit 0
  fi
}
