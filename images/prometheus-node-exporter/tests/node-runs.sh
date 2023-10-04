#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

RAND_HEX=${1:-abcdef}

kubectl wait --for=condition=Ready pods -n prometheus-${RAND_HEX} -l app.kubernetes.io/instance=prometheus-${RAND_HEX} --timeout=120s

kubectl port-forward -n prometheus-${RAND_HEX} service/prometheus-${RAND_HEX}-prometheus-node-exporter ${FREE_PORT}:$PROM_PORT &
pid=$!
trap "kill $pid" EXIT
sleep 5
curl http://localhost:${FREE_PORT}/metrics | grep "node_"
