#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

function cleanup() {
	# Print debug logs and status
	kubectl get pods
	kubectl describe pods

	# Seeing intermittent failures if we don't wait for a bit here
	# The `rollout status`` below should wait for terminated pods to be removed
	# However, we still occasionally see a terminating pod which fails when checking logs
	sleep 10
	kubectl logs --selector application=kube-downscaler
}

trap cleanup EXIT

# Deploy the kube-downscaler yaml
kubectl apply -f https://codeberg.org/hjacobs/kube-downscaler/raw/tag/23.2.0/deploy/config.yaml
kubectl apply -f https://codeberg.org/hjacobs/kube-downscaler/raw/tag/23.2.0/deploy/rbac.yaml
kubectl apply -f https://codeberg.org/hjacobs/kube-downscaler/raw/tag/23.2.0/deploy/deployment.yaml

# The pod can take a few seconds to appear after the deployment and the replicaset are all created and reconcile
sleep 10

# Wait for the default kube-downscaler to be healthy
kubectl wait --for=condition=ready pod --selector application=kube-downscaler --timeout=120s

# Swap out the image
kubectl set image deployment/kube-downscaler downscaler="${IMAGE_NAME}"

# Wait for the replicaset to be ready and old pods to terminated
kubectl rollout status deployment/kube-downscaler --timeout=120s

# Check the kube-downscaler pods are deployed and healthy
kubectl wait --for=condition=ready pod --selector application=kube-downscaler --timeout=120s
