#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl port-forward -n "${KSM_NAME}" "svc/${KSM_NAME}" "${FREE_PORT}:8080" &
pid=$!
trap "kill $pid" EXIT

sleep 5
curl "localhost:${FREE_PORT}/metrics" | grep kube
