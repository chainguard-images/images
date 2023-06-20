#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
	echo "Must set IMAGE_NAME environment variable. Exiting."
	exit 1
fi

TOKEN=donkey
NETWORK="k3s"

docker network create $NETWORK

# Run the server
docker run -it --rm --privileged -d \
	--network=$NETWORK \
	--name k3s-server-1 \
	-p 6443:6443 \
	--hostname k3s-server-1 \
	-v $(pwd)/k3s/:/etc/rancher/k3s/ \
	$IMAGE_NAME server \
	--snapshotter=native --token $TOKEN

# Run an agent (some conformance tests require >1 node)
docker run -it --rm --privileged -d \
	--network=$NETWORK \
	--name k3s-agent-1 \
	--hostname k3s-agent-1 \
	$IMAGE_NAME agent \
	--snapshotter=native --server https://$NETWORK --token $TOKEN

sleep 5

KUBECONFIG=k3s/k3s.yaml kubectl wait --for=condition=ready pod -n kube-system --all

curl -fL -o sonobuoy.tar.gz https://github.com/vmware-tanzu/sonobuoy/releases/download/v0.56.17/sonobuoy_0.56.17_linux_amd64.tar.gz
tar -xzf sonobuoy.tar.gz
chmod +x sonobuoy

# These take a while
./sonobuoy run --wait 70 --kubeconfig k3s/k3s.yaml
