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

# Note testing with local version of vault and stable version of vault-k8s image
helm install vault hashicorp/vault \
	--namespace vault \
	--create-namespace \
	--set injector.image.repository=cgr.dev/chainguard/vault-k8s \
	--set injector.image.tag=latest \
	--set injector.agentImage.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
	--set injector.agentImage.tag=${IMAGE_TAG} \
	--set server.image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
	--set server.image.tag=${IMAGE_TAG}

sleep 3

kubectl wait --for=condition=ready pod -n vault --selector app.kubernetes.io/instance=vault-0 --timeout=120s
