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
    
    # Seeing intermittent failures if we don't wait for a bit here
    # The `rollout status`` below should wait for terminated pods to be removed
    # However, we still occasionally see a terminating pod which fails when checking logs
    sleep 10 
    kubectl logs --selector app=csi-provisioner
}

trap cleanup EXIT

# Deploy the csi-provisioner yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/rbac.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/deployment.yaml

# The pod can take a few seconds to appear after the deployment and the replicaset are all created and reconcile
sleep 10

# Wait for the default csi-provisioner to be healthy
kubectl wait --for=condition=ready pod --selector app=csi-provisioner --timeout=120s

# Swap out the image
kubectl set image deployment/csi-provisioner csi-provisioner="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}"

# Wait for the replicaset to be ready and old pods to terminated
kubectl rollout status deployment/csi-provisioner --timeout=120s

# Check the csi-provisioner pods are deployed and healthy
kubectl wait --for=condition=ready pod --selector app=csi-provisioner --timeout=120s