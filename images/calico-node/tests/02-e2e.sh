#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
	echo "Must set IMAGE_NAME environment variable. Exiting."
	exit 1
fi

case $(uname -m) in
aarch64) ARCH="aarch64" ;;
x86_64) ARCH="amd64" ;;
esac

git clone --depth 1 https://github.com/projectcalico/calico.git calico

pushd calico/node || exit

# shellcheck disable=2016
sed -i 's/calico-node.tar: $(NODE_CONTAINER_CREATED)/calico-node.tar:/g' Makefile

docker pull $IMAGE_NAME
docker tag $IMAGE_NAME "node:latest-${ARCH}"

# This is done by `make k8s-test`, but run it here to be explicit
# TODO: Replace the rest of the upstream images with Chainguard Images equivalents
make calico-node.tar

trap 'make kind-k8st-cleanup' EXIT
make k8s-test
