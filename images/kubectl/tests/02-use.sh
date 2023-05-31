#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
	echo "Must set IMAGE_NAME environment variable. Exiting."
	exit 1
fi

# Get the kind kubeconfig
# Create a kubeconfig with admin access to kind (from inside docker network)

KIND_IP="$(docker ps | grep 'control-plane' | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Networks["kind"].IPAddress')"
if [[ "${KIND_IP}" == "" ]]; then
    echo "Could not get KIND_IP. Is kind running? Exiting."
    exit 1
fi

TMPDIR="$(mktemp -d)"
mkdir -p "${TMPDIR}/.kube"
kind get kubeconfig | yq '.clusters[].cluster.server = "https://'${KIND_IP}':6443"' \
    > "${TMPDIR}/.kube/config"
docker run --rm -w /work --network kind \
    -v "${TMPDIR}:/work" \
    -e KUBECONFIG=/work/.kube/config \
    "${IMAGE_NAME}" get nodes
