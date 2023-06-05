#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

kubectl run prometheus-node-exporter --image=${IMAGE_NAME}
kubectl wait --for=condition=ready pod prometheus-node-exporter

kubectl port-forward pod/prometheus-node-exporter 9100:9100 &
pid=$!
trap "kill $pid" EXIT
sleep 5
curl http://localhost:9100/metrics | grep "node_"

