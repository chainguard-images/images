#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

function preflight() {
  if [[ "${IMAGE_REGISTRY}" == "" ]]; then
    echo "Must set IMAGE_REGISTRY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_REPOSITORY}" == "" ]]; then
    echo "Must set IMAGE_REPOSITORY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_TAG}" == "" ]]; then
    echo "Must set IMAGE_TAG environment variable. Exiting."
    exit 1
  fi
}

preflight

function cleanup() {
    # Get the logs from keda before exiting
    kubectl describe pod --selector app.kubernetes.io/instance=keda --namespace keda
    kubectl logs --selector app.kubernetes.io/instance=keda --namespace keda
}

trap cleanup EXIT

helm repo add kedacore https://kedacore.github.io/charts
helm repo update

kubectl create namespace keda

helm install keda kedacore/keda --namespace keda \
    --set image.keda.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set image.keda.tag="${IMAGE_TAG}" \
    --set image.pullPolicy=IfNotPresent # The same pullPolicy is used for multiple images, so we have to allow the others to get pulled.

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=keda --namespace keda --timeout=120s
