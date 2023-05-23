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
    # Get the logs from stakater before exiting
    kubectl describe pod --selector app=reloader-reloader
    kubectl logs --selector app=reloader-reloader
}

trap cleanup EXIT

helm repo add stakater https://stakater.github.io/stakater-charts

helm repo update

helm install reloader stakater/reloader \
  --set reloader.deployment.image.name="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
  --set reloader.deployment.image.tag="${IMAGE_TAG}"

kubectl wait --for=condition=ready pod --selector app=reloader-reloader --timeout=120s
