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

# Upstream repository does not provide a Helm Chart repo,
# so we have to manually install it from source.
TMPDIR="$(mktemp -d)"
git clone --depth=1 https://github.com/wish/nodetaint ${TMPDIR}
cd ${TMPDIR}

sed -i "s|apiVersion: policy/v1beta1|apiVersion: policy/v1|g" ./chart/templates/poddisruptionbudget.yaml

helm install nodetaint ./chart \
  --namespace nodetaint \
  --create-namespace \
  --set image.registry=${IMAGE_REGISTRY} \
  --set image.repository=${IMAGE_REPOSITORY} \
  --set image.tag=${IMAGE_TAG} \
  --wait

# Wait for helm to catch up
sleep 3

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=nodetaint --namespace nodetaint
