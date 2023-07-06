#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

curl https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/deployment.yaml | \
    sed "s|registry.k8s.io/k8s-staging-sig-storage/csi-attacher:.*|${IMAGE_NAME}|g" | \
    kubectl apply -f -
kubectl apply -f  https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/rbac.yaml

sleep 5

kubectl rollout status deployment csi-attacher --timeout=120s
