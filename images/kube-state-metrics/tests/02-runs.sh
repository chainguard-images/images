#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

kubectl run $IMAGE_NAME-smoketest --immage=${IMAGE_NAME}
kubectl wait --for=condition=ready pod $IMAGE_NAME-smoketest

kubectl port-forward pod/$IMAGE_NAME-smoketest 8080:8080 &
pid=$!
trap "kill $pid" EXIT
curl localhost:8080/metrics | grep kube
