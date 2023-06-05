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

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm upgrade --install metrics-server metrics-server/metrics-server \
	--namespace metrics-server \
	--create-namespace \
	--set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
	--set image.tag="${IMAGE_TAG}" \
	--set "args[0]=--kubelet-insecure-tls"

sleep 3

kubectl wait --for=condition=ready pod -n metrics-server --selector app.kubernetes.io/instance=metrics-server --timeout=120s

sleep 10

kubectl top pods -A  | grep Mi