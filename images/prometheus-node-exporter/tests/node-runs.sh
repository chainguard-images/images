#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

RAND_HEX=${1:-abcdef}

kubectl wait --for=condition=Ready pods -n prometheus-node-bitnami-${RAND_HEX} -l app.kubernetes.io/instance=prometheus-node-bitnami-${RAND_HEX} --timeout=120s

kubectl port-forward -n prometheus-node-bitnami-${RAND_HEX} service/prometheus-node-bitnami-${RAND_HEX}-node-exporter ${FREE_PORT}:$PROM_PORT &
pid=$!
trap "kill $pid" EXIT
sleep 5
curl http://localhost:${FREE_PORT}/metrics | grep "node_"
