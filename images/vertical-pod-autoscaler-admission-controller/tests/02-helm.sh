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

# The following Helm Chart test covers the each of the three components of the Vertical Pod Autoscaler:
# - Admission Controller
# - Recommender
# - Updater

helm repo add cowboysysop https://cowboysysop.github.io/charts/
helm upgrade --install vpa cowboysysop/vertical-pod-autoscaler \
	--namespace vpa \
	--create-namespace \
	--set admissionController.image.registry="${IMAGE_REGISTRY}" \
	--set admissionController.image.repository="${IMAGE_REPOSITORY}" \
	--set admissionController.image.tag="${IMAGE_TAG}" \
	--set recommender.image.registry="${IMAGE_REGISTRY}" \
	--set recommender.image.repository=chainguard/vertical-pod-autoscaler-recommender \
	--set recommender.image.tag=latest \
	--set updater.image.registry="${IMAGE_REGISTRY}" \
	--set updater.image.repository=chainguard/vertical-pod-autoscaler-updater \
	--set updater.image.tag=latest \
	--set crds.image.registry="${IMAGE_REGISTRY}" \
	--set crds.image.repository=chainguard/kubectl \
	--set crds.image.tag=latest

sleep 3

kubectl wait --for=condition=ready pod -n vpa --selector app.kubernetes.io/instance=vpa --timeout=120s
