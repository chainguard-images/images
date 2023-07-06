#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

uid="k3s-$FREE_PORT"
TMPDIR=$uid
mkdir -p $TMPDIR

# Simple test to make sure the server comes up and has running pods after ~1m
docker run --name "$uid" -d --rm -it --privileged \
	-p $FREE_PORT:$FREE_PORT \
	-v $(pwd)/$TMPDIR:/etc/rancher/k3s/ \
	$IMAGE_NAME server --https-listen-port $FREE_PORT --write-kubeconfig-mode 0644

cleanup() {
	rm -rf $TMPDIR
	docker stop "$uid" -t 1
}
trap cleanup EXIT

# Wait just a hot second for the server to boot before we can kubectl
sleep 30

# Wait for the traefik jobs, to complete, this flexes pod creation as well as
# the svc lb creation, and more importantly, can fit into a kubectl wait
# oneliner
KUBECONFIG=$TMPDIR/k3s.yaml kubectl wait --for=condition=complete job --all -n kube-system --timeout=120s
