#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl port-forward -n prometheus service/prometheus-prometheus-node-exporter ${FREE_PORT}:9100 &
pid=$!
trap "kill $pid" EXIT
sleep 5
curl http://localhost:${FREE_PORT}/metrics | grep "node_"
