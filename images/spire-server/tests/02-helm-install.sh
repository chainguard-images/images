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

function ensure_spire_is_installed(){
   helm repo add spiffe https://spiffe.github.io/helm-charts/
   helm repo update
   helm install spire spiffe/spire \
   --namespace spire-system \
   --create-namespace \
   --set spire-server.image.registry="${IMAGE_REGISTRY}" \
   --set spire-server.image.repository="${IMAGE_REPOSITORY}" \
   --set spire-server.image.tag="${IMAGE_TAG}"
}

function test(){
    kubectl wait --for=condition=ready pod -n spire-system --selector app.kubernetes.io/instance=spire --timeout=120s
}

preflight
ensure_spire_is_installed
sleep 3
test