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

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install redis bitnami/redis \
    --wait

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm install istio-base istio/base \
    --namespace istio-system \
    --create-namespace \
    --wait

helm repo add xyctruth https://xyctruth.github.io/istio-ratelimit
helm install ratelimit xyctruth/istio-ratelimit \
    --set ratelimit.image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set ratelimit.image.tag="${IMAGE_TAG}"
	
kubectl set env deployment/ratelimit-istio-ratelimit REDIS_URL=ratelimit-redis-master:6379

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=ratelimit --namespace default
