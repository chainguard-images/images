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

helm repo add hashicorp https://helm.releases.hashicorp.com

# Note testing with local version of vault-k8s and stable version of vault image
helm install vault hashicorp/vault \
	--namespace vault \
	--create-namespace \
	--set injector.image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
	--set injector.image.tag=${IMAGE_TAG} \
	--set injector.agentImage.repository=cgr.dev/chainguard/vault \
	--set injector.agentImage.tag=latest \
	--set server.image.repository=cgr.dev/chainguard/vault \
	--set server.image.tag=latest

max_retries=40
retry_count=0

while [ $retry_count -lt $max_retries ]; do
    sleep 1
    kubectl get pod -n vault vault-0 | grep "Running" && rc=$? || rc=$? 
    if [ $rc -eq 0 ]; then
        break
    fi
    retry_count=$((retry_count + 1))
done

# Now unseal vault, which should move it to ready
kubectl exec -n vault vault-0 -- vault operator init \
    -key-shares=1 \
    -key-threshold=1 \
    -format=json > cluster-keys.json

KEY=$(jq -r ".unseal_keys_b64[]" cluster-keys.json)
kubectl exec -n vault vault-0 -- vault operator unseal $KEY

kubectl wait --for=condition=ready -n vault --timeout=120s pod/vault-0
