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

helm repo add nvdp https://nvidia.github.io/k8s-device-plugin

helm upgrade --install nvdp nvdp/nvidia-device-plugin \
  --namespace nvidia-device-plugin \
  --create-namespace \
  --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
  --set image.tag="${IMAGE_TAG}"

# Since it's challenging to satisfy the prerequisites as described in the
# https://github.com/NVIDIA/k8s-device-plugin#prerequisites, we'll just wait
# for the Pod to be CrashLoopBackOff and then ensure some of the expected
# output is present in the logs.

kubectl wait --for=jsonpath='{.status.containerStatuses[0].state.waiting.reason}'=CrashLoopBackOff pod --selector app.kubernetes.io/name=nvidia-device-plugin --namespace nvidia-device-plugin

POD=$(kubectl get pod -l app.kubernetes.io/name=nvidia-device-plugin -o name)
LOGS=$(kubectl logs "$POD")

echo "${LOGS}" | grep "Starting FS watcher"
echo "${LOGS}" | grep "Starting OS watcher"
echo "${LOGS}" | grep "Incompatible platform detected"
