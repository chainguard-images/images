#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

IMAGE_REPOSITORY=$(echo "${IMAGE_NAME}" | cut -d: -f1)
IMAGE_TAG="$(echo "${IMAGE_NAME}" | cut -d: -f2)"

helm repo add jetstack https://charts.jetstack.io

helm upgrade --install \
    cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --create-namespace \
    --set installCRDs=true \
    --set webhook.image.repository="${IMAGE_REPOSITORY}" \
    --set webhook.image.tag="${IMAGE_TAG}"

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cert-manager --namespace cert-manager
