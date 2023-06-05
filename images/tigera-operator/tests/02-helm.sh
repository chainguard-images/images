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
    # Get the logs from cluster-autoscaler before exiting
    kubectl describe pod --namespace tigera-operator --selector name=tigera-operator
    kubectl logs --namespace tigera-operator --selector name=tigera-operator
}

trap cleanup EXIT

helm repo add projectcalico https://projectcalico.docs.tigera.io/charts
helm repo update

helm install calico projectcalico/tigera-operator \
    --namespace tigera-operator \
    --create-namespace \
    --set tigeraOperator.registry="${IMAGE_REGISTRY}" \
    --set tigeraOperator.image="${IMAGE_REPOSITORY}" \
    --set tigeraOperator.version="${IMAGE_TAG}" \
    --set image.pullPolicy=IfNotPresent

kubectl wait --namespace tigera-operator --for=condition=ready pod --selector name=tigera-operator --timeout=120s
