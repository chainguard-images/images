#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

metrics_service=$(kubectl -n "${PPE_NAME}" get svc | grep metrics | cut -d' ' -f1)

kubectl port-forward -n "${PPE_NAME}" "svc/${metrics_service}" "${FREE_PORT}:9187" &

pid=$!
trap "kill $pid" EXIT

sleep 5
curl "localhost:${FREE_PORT}/metrics" | grep 'pg_'
