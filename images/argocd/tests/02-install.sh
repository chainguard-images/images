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

helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade -i argocd argo/argo-cd \
	--namespace argocd \
	--create-namespace \
	--set redis.image.repository=cgr.dev/chainguard/redis \
	--set redis.image.tag=latest \
	--set dex.image.repository=cgr.dev/chainguard/dex \
	--set dex.image.tag=latest \
	--set global.image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
	--set global.image.tag="${IMAGE_TAG}" \
	--set repoServer.image.repository="quay.io/argoproj/argocd" \
	--set repoServer.image.tag="latest"

sleep 3

kubectl wait --for=condition=ready pod -n argocd --selector app.kubernetes.io/instance=argocd --timeout=120s
