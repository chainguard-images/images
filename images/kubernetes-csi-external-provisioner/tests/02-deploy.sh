#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

function cleanup() {
	# Print debug logs and status
	kubectl get pods
	kubectl describe pods

	# Seeing intermittent failures if we don't wait for a bit here
	# The `rollout status`` below should wait for terminated pods to be removed
	# However, we still occasionally see a terminating pod which fails when checking logs
	# Ignore errors, since this is just for debugging
	set +e
	sleep 10
	kubectl logs --selector app=csi-provisioner
}

trap cleanup EXIT

# Deploy the csi-provisioner yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/rbac.yaml
curl -LO https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/deployment.yaml
kubectl set image csi-provisioner=${IMAGE_NAME} --local -o yaml -f deployment.yaml | kubectl apply -f -

# Check the csi-provisioner pods are deployed and healthy
kubectl wait --for=condition=ready pod --selector app=csi-provisioner --timeout=120s
