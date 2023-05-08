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

# Deploy the dashboard yaml, then swap out the image and patch the pull policy

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl set image -n kubernetes-dashboard deployment/kubernetes-dashboard kubernetes-dashboard="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}"
kubectl patch deployment -n kubernetes-dashboard kubernetes-dashboard --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/imagePullPolicy", "value": "Never"}]'

# Wait for the dashboard to be healthy
kubectl wait --for=condition=ready pod --selector k8s-app=kubernetes-dashboard --namespace kubernetes-dashboard

# Start up a port-forward to the dashboard and curl the endpoint to make sure it's working
kubectl port-forward --namespace kubernetes-dashboard service/kubernetes-dashboard 8443:443 &

# Sleep for 10 seconds to allow the port-forward to properly set up
(sleep 10 && curl -k http://localhost:8443/health) | grep '"running":true'
