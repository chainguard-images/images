#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

helm repo add jetstack https://charts.jetstack.io

helm install cert-manager \
    --namespace cert-manager \
    --create-namespace \
    --set installCRDs=true \
    --wait \
    jetstack/cert-manager

helm install trust-manager \
    --namespace cert-manager \
    --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set image.tag="${IMAGE_TAG}" \
    --wait \
    jetstack/trust-manager
