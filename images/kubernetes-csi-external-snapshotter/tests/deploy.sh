#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

VERSION=v6.2.2

tmpdir=$(mktemp -d); cd "${tmpdir}"
curl -sLO https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/csi-snapshotter/setup-csi-snapshotter.yaml
kubectl set image csi-snapshotter=${IMAGE_NAME} --local -o yaml -f setup-csi-snapshotter.yaml | kubectl apply -f -
# TODO: Test this with csi-external-provisioner

kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/csi-snapshotter/rbac-csi-snapshotter.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/csi-snapshotter/rbac-external-provisioner.yaml

kubectl rollout status statefulset csi-snapshotter --timeout=120s
