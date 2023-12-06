#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl rollout status \
    --namespace ${NAMESPACE} \
    --timeout 5m \
    deployment.apps/${NAME}-nri-prometheus 

kubectl port-forward -n "${NAMESPACE}" "deployment.apps/${NAME}-nri-prometheus" "${FREE_PORT}:8080" &

pid=$!
trap "kill $pid" EXIT

sleep 5

# Make sure we're picking up some stats from prometheus
curl "localhost:${FREE_PORT}/metrics" | grep 'nr_stats'
