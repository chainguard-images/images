#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

curl https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/v6.2.2/deploy/kubernetes/snapshot-controller/setup-snapshot-controller.yaml | \
    sed "s|registry.k8s.io/sig-storage/snapshot-controller:.*|${IMAGE_NAME}|g" | \
    kubectl apply -f -

kubectl rollout status deployment snapshot-controller -n kube-system --timeout=120s
