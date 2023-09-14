#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

VERSION=${VERSION:-v6.2.2}

kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/client/config/crd/snapshot.storage.k8s.io_volumesnapshots.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/client/config/crd/snapshot.storage.k8s.io_volumesnapshotclasses.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/client/config/crd/snapshot.storage.k8s.io_volumesnapshotcontents.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/snapshot-controller/rbac-snapshot-controller.yaml
curl https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/snapshot-controller/setup-snapshot-controller.yaml | \
    sed "s|registry.k8s.io/sig-storage/snapshot-controller:.*|${IMAGE_NAME}|g" | \
    kubectl apply -f -

kubectl rollout status deployment snapshot-controller -n kube-system --timeout=120s
