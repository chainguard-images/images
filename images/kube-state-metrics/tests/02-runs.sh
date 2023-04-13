#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

kubectl run kube-state-metrics-smoketest --image=${IMAGE_NAME}
kubectl wait --for=condition=ready pod kube-state-metrics-smoketest

kubectl port-forward pod/kube-state-metrics-smoketest 8080:8080 &
pid=$!
trap "kill $pid" EXIT
sleep 5
curl localhost:8080/metrics | grep kube
