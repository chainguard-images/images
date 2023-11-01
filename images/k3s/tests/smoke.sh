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

tries=0
while [ $tries -le 20 ]; do
	KUBECONFIG=$TMPDIR/k3s.yaml kubectl wait --for=condition=complete job --all -n kube-system --timeout=120s >/dev/null 2>&1 && exit 0
	sleep 5
	tries=$((tries + 1))
done

echo 'Failed to boot k3s'
exit 1
