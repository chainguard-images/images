#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

IMAGE_REPOSITORY=$(echo "${IMAGE_NAME}" | cut -d: -f1)
IMAGE_TAG="$(echo "${IMAGE_NAME}" | cut -d: -f2)"

helm repo add weaviate https://weaviate.github.io/weaviate-helm

# The helm chart doesn't allow overriding the full image registry or imagePullPolicy, so we need to do some surgery.
helm install  my-weaviate weaviate/weaviate \
    --set image.repo=${IMAGE_REPOSITORY} --set image.tag=${IMAGE_TAG} \
    --dry-run | \
    sed  's/imagePullPolicy: Always/imagePullPolicy: Never/g' | \
    sed 's|docker.io/||g'  | tail -n +10 | \
    kubectl apply -f -

kubectl wait --for=condition=ready pod weaviate-0
