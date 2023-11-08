#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install redis bitnami/redis \
	--set replica.replicaCount=1 \
    --wait

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm upgrade --install istio-base istio/base \
    --namespace istio-system \
    --create-namespace \
    --wait

helm repo add xyctruth https://xyctruth.github.io/istio-ratelimit
helm install ratelimit xyctruth/istio-ratelimit \
    --set ratelimit.image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set ratelimit.image.tag="${IMAGE_TAG}"

kubectl set env deployment/ratelimit-istio-ratelimit REDIS_URL=ratelimit-redis-master:6379

# This needs a long time to come up, the redis deployment is pretty slow.
kubectl rollout status deployment/ratelimit-istio-ratelimit --timeout=120s
