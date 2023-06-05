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

# Note testing with local version of vault and stable version of vault-k8s image
helm install vault hashicorp/vault \
	--namespace vault \
	--create-namespace \
	--set injector.image.repository=cgr.dev/chainguard/vault-k8s \
	--set injector.image.tag=latest \
	--set injector.agentImage.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
	--set injector.agentImage.tag=${IMAGE_TAG} \
	--set server.image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
	--set server.image.tag=${IMAGE_TAG}

max_retries=20
retry_count=0

while [ $retry_count -lt $max_retries ]; do
    sleep 2
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
