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

helm repo add hashicorp https://helm.releases.hashicorp.com

# Note testing with local version of vault-k8s and stable version of vault image
helm install vault hashicorp/vault \
	--namespace vault \
	--create-namespace \
	--set injector.image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
	--set injector.image.tag=${IMAGE_TAG} \
	--set injector.agentImage.repository=cgr.dev/chainguard/vault \
	--set injector.agentImage.tag=latest \
	--set server.image.repository=cgr.dev/chainguard/vault \
	--set server.image.tag=latest

sleep 3

kubectl wait --for=condition=ready pod -n vault --selector app.kubernetes.io/instance=vault-0 --timeout=120s
