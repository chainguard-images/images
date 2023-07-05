#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/rbac.yaml
curl -sL https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/deployment.yaml | \
    sed "s|registry.k8s.io/k8s-staging-sig-storage/csi-attacher:.*|${IMAGE_NAME}|g" | \
    kubectl apply -f -

kubectl rollout status deployment csi-attacher --timeout=120s
