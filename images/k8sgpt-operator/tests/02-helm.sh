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

helm repo add k8sgpt https://charts.k8sgpt.ai/
helm install release k8sgpt/k8sgpt-operator \
	-n k8sgpt-operator-system \
	--create-namespace \
	--set manager.image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
	--set manager.image.tag="${IMAGE_TAG}"

sleep 3

kubectl wait --for=condition=ready pod -n k8sgpt-operator-system --selector "app.kubernetes.io/name=k8sgpt-operator" --timeout=120s
