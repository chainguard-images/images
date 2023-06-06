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

function ensure_kyverno_is_installed(){
   helm repo add kyverno https://kyverno.github.io/kyverno/
   helm install kyverno kyverno/kyverno -n kyverno --create-namespace \
	    --set backgroundController.image.registry="${IMAGE_REGISTRY}" \
	    --set backgroundController.image.repository="${IMAGE_REPOSITORY}" \
	    --set backgroundController.image.tag="${IMAGE_TAG}" \
}

function test(){
    kubectl wait --for=condition=ready pod -n kyverno --selector app.kubernetes.io/component=background-controller --timeout=120s
}

preflight
ensure_kyverno_is_installed
sleep 3
test