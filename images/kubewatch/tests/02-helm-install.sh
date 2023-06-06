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
    # Get the logs and pod info in case there's a failure
    kubectl describe pod --selector app.kubernetes.io/instance=kubewatch-helm-test
    kubectl logs --selector app.kubernetes.io/instance=kubewatch-helm-test
}

trap cleanup EXIT

helm repo add robusta https://robusta-charts.storage.googleapis.com
helm repo update

helm upgrade --install kubewatch-helm-test \
          robusta/kubewatch \
          --set image.registry=${IMAGE_REGISTRY} \
          --set image.repository=${IMAGE_REPOSITORY} \
          --set image.tag=${IMAGE_TAG}

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=kubewatch-helm-test --timeout=120s
