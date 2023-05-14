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
    kubectl get pods --namespace kubernetes-dashboard
    kubectl describe pods --namespace kubernetes-dashboard
    kubectl logs --selector k8s-app=kubernetes-dashboard --namespace kubernetes-dashboard
}

trap cleanup EXIT

# Deploy the dashboard yaml, then swap out the image and patch the pull policy

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl set image -n kubernetes-dashboard deployment/kubernetes-dashboard kubernetes-dashboard="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}"
kubectl patch deployment -n kubernetes-dashboard kubernetes-dashboard --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/imagePullPolicy", "value": "Never"}]'

# The pod can take a few seconds to appear after the deployment and the replicaset are all created and reconcile
sleep 10

# Wait for the dashboard to be healthy
kubectl wait --for=condition=ready pod --selector k8s-app=kubernetes-dashboard --namespace kubernetes-dashboard --timeout=120s
