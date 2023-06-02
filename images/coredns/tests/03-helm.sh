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

function cleanup() {
	# Get the logs from keda before exiting
	kubectl describe pod --selector app.kubernetes.io/instance=coredns
	kubectl logs --selector app.kubernetes.io/instance=coredns
}

trap cleanup EXIT

helm repo add coredns https://coredns.github.io/helm
helm install coredns coredns/coredns \
	--set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
	--set image.tag="${IMAGE_TAG}" \
	--set isClusterService=false

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=coredns --timeout=120s
