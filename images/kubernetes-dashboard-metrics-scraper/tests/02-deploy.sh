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
    # Print debug logs and status
    kubectl get pods
    kubectl describe pods
    kubectl logs --selector app.kubernetes.io/component=kubernetes-dashboard
}

trap cleanup EXIT

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install my-release kubernetes-dashboard/kubernetes-dashboard  \
  --set metricsScraper.image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
  --set metricsScraper.image.tag=${IMAGE_TAG} \
  --set metricsScraper.enabled=true

# The pod can take a few seconds to appear after the deployment and the replicaset are all created and reconcile
sleep 10

# Wait for the dashboard to be healthy
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/component=kubernetes-dashboard --timeout=120s
