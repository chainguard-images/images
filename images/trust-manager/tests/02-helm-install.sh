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

preflight
ensure_trust_manager
sleep 3
test