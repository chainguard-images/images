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

helm repo add weaviate https://weaviate.github.io/weaviate-helm
wget https://raw.githubusercontent.com/weaviate/weaviate-helm/v16.2.0/weaviate/values.yaml

# The helm chart doesn't allow overriding the full image registry or imagePullPolicy, so we need to do some surgery.
helm install  my-weaviate weaviate/weaviate \
    --version 16.2.0 \
    --values ./values.yaml \
    --set image.repo="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" --set image.tag="${IMAGE_TAG}" \
    --dry-run | \
    sed  's/imagePullPolicy: Always/imagePullPolicy: Never/g' | \
    sed 's|docker.io/||g'  | tail -n +10 | \
    kubectl apply -f -

kubectl wait --for=condition=ready pod weaviate-0
