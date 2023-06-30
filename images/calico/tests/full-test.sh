#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

ARCH="amd64"
if [[ $(uname -m) == "aarch64" ]]; then
    ARCH="aarch64"
fi

TMP=$(mktemp -d)
git clone --depth 1 https://github.com/projectcalico/calico.git ${TMP}/calico

pushd ${TMP}/calico/node || exit

# shellcheck disable=2016
sed -i 's/calico-node.tar: $(NODE_CONTAINER_CREATED)/calico-cni.tar:/g' Makefile

docker pull $IMAGE_NAME
docker tag $IMAGE_NAME "cni:latest-${ARCH}"

# This is done by `make k8s-test`, but run it here to be explicit
# TODO: Replace the rest of the upstream images with Chainguard Images equivalents
make calico-cni.tar

trap 'make kind-k8st-cleanup' EXIT
make k8s-test
