#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

VERSION=v6.2.2

curl https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/csi-snapshotter/setup-csi-snapshotter.yaml | \
    sed "s|registry.k8s.io/sig-storage/csi-snapshotter:.*|${IMAGE_NAME}|g" | \
    kubectl apply -f -
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/csi-snapshotter/rbac-csi-snapshotter.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/csi-snapshotter/rbac-external-provisioner.yaml

kubectl rollout status statefulset csi-snapshotter --timeout=120s
