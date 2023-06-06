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

function ensure_gatekeeper_is_installed(){
   helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
   # Unfortunately the helm chart uses the same 'release' value as the tag for multiple images in the chart
   # Re-overriding it with the preInstall.crdRepository.image.tag value works, but requires us to hardcode some other
   # image names.
   helm install --name-template=gatekeeper \
		--namespace gatekeeper-system \
		--create-namespace \
	    --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
	    --set image.release="${IMAGE_TAG}" \
		--set preInstall.crdRepository.image.tag=v3.13.0-beta.1 \
		--set preInstall.crdRepository.image.repository=openpolicyagent/gatekeeper-crds \
        gatekeeper/gatekeeper
}

function test(){
    kubectl wait --for=condition=ready pod -n gatekeeper-system --selector app=gatekeeper --timeout=120s
}

preflight
ensure_gatekeeper_is_installed
sleep 3
test