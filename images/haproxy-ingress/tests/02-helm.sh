#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

function cleanup() {
    # Get the logs from haproxy-ingress before exiting
    kubectl describe pod --selector "app.kubernetes.io/name=haproxy-ingress"
    kubectl logs --selector "app.kubernetes.io/name=haproxy-ingress"
}

trap cleanup EXIT

helm repo add haproxy-ingress https://haproxy-ingress.github.io/charts

helm repo update

helm install ingress haproxy-ingress/haproxy-ingress \
  --set controller.image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
  --set controller.image.tag="${IMAGE_TAG}"

kubectl wait --for=condition=ready pod --selector "app.kubernetes.io/name=haproxy-ingress" --timeout=120s
