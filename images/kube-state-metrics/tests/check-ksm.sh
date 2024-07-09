#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source "$LIBS/libs.sh"

KSM_NAME="${1}"
KSM_NAMESPACE="kube-state-metrics"

kubectl port-forward --pod-running-timeout=5m \
  -n "${KSM_NAMESPACE}" "svc/${KSM_NAME}-kube-state-metrics" "8080:8080" &

sleep 5

curl "localhost:8080/metrics" | grep kube
