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

function ensure_thanos-operator_is_installed(){
   helm repo add banzaicloud-stable https://kubernetes-charts.banzaicloud.com
   helm install thanos-operator \
                --create-namespace \
                --namespace monitor \
				banzaicloud-stable/thanos-operator \
	            --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
	            --set image.tag="${IMAGE_TAG}"
}

function test(){
    kubectl wait --for=condition=ready pod -n monitor --selector app.kubernetes.io/name=thanos-operator --timeout=120s
}

preflight
ensure_thanos-operator_is_installed
sleep 3
test