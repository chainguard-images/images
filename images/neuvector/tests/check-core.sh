#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Parameters
NAMESPACE="neuvector"
RELEASE_NAME="core"

# Wait for deployment
kubectl rollout status deployment/neuvector-manager-pod -n "${NAMESPACE}"
kubectl rollout status deployment/neuvector-scanner-pod -n "${NAMESPACE}"
kubectl rollout status deployment/neuvector-controller-pod -n "${NAMESPACE}"
