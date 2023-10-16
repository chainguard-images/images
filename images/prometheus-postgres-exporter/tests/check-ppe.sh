#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl port-forward -n "${PPE_NAME}" "svc/${PPE_NAME}" "${FREE_PORT}:9187" &
pid=$!
trap "kill $pid" EXIT

sleep 5
curl "localhost:${FREE_PORT}/metrics" | grep 'pg_'
