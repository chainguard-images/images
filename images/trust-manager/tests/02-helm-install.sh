#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

function ensure_trust_manager(){
    helm repo add jetstack https://charts.jetstack.io
    helm install cert-manager \
        --namespace cert-manager \
        --create-namespace \
        --set installCRDs=true \
        jetstack/cert-manager
    helm install trust-manager \
        --namespace cert-manager \
	    --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
	    --set image.tag="${IMAGE_TAG}" \
        jetstack/trust-manager
}

function test(){
    kubectl wait --for=condition=ready pod -n cert-manager --selector app=trust-manager --timeout=120s
}

ensure_trust_manager
sleep 3
test