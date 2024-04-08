#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

declare -a expected_logs=(
    "Building new tls configuration using step-ca x509 Signer Interface"
    "Starting Smallstep CA"
    "Serving HTTPS on :9000 ..."
)
declare -a missing_logs=()

# Loop to check the helm chart deployed and pod is ready
verify_helm_install() {
    # Test if step-ca is installed and pod is ready in a loop
    while ! kubectl -n step-ca get pods -o jsonpath='{.items[1].status.containerStatuses[0].ready}' | grep -q true; do
        sleep 15
    done
}

# Check to see if pod logs contain the expected log lines
test_validate_pod_logs() {
    local logs=$(kubectl logs -n step-ca step-ca-step-certificates-0 -c step-certificates)
    local logs_found=true
    # Search the pod logs for our expected log lines
    for log in "${expected_logs[@]}"; do
        if ! echo "$logs" | grep -Fq "$log"; then
            logs_found=false
        fi
    done

    if $logs_found; then
        return 0
    fi

    # Record missing logs
    for log in "${expected_logs[@]}"; do
        if ! echo "${logs}" | grep -Fq "$log"; then
            missing_logs+=("${log}")
        fi
    done

    echo "FAILED: The following log lines were not found:"
    printf '%s\n' "${missing_logs[@]}"
    exit 1
}

verify_helm_install
test_validate_pod_logs
