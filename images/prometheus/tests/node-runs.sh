#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl run prometheus-node-exporter --image=${IMAGE_NAME}
kubectl wait --for=condition=ready pod prometheus-node-exporter

kubectl port-forward pod/prometheus-node-exporter ${FREE_PORT}:9100 &
pid=$!
trap "kill $pid" EXIT
sleep 5
curl http://localhost:${FREE_PORT}/metrics | grep "node_"

