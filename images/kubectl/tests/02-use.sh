#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${IMAGE_NAME}"

# Get the k3s kubeconfig
# Create a kubeconfig with admin access to k3s (from inside docker network)

K3S_IP="$(docker ps | grep 'k3d-k3s-default-server-0' | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Networks["k3d-k3s-default"].IPAddress')"
if [[ "${K3S_IP}" == "" ]]; then
	echo "Could not get K3S_IP. Is k3s running? Exiting."
	exit 1
fi

TMPDIR="$(mktemp -d)"
mkdir -p "${TMPDIR}/.kube"
k3d kubeconfig get k3s-default | yq '.clusters[].cluster.server = "https://'${K3S_IP}':6443"' \
	>"${TMPDIR}/.kube/config"

# Make the file readable and writable by all since we use a non-root user
sudo chmod -R 755 "${TMPDIR}"

docker run --rm -w /work --network k3d-k3s-default \
	-v "${TMPDIR}:/work" \
	-e KUBECONFIG=/work/.kube/config \
	"${IMAGE_NAME}" get nodes
