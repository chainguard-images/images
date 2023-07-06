#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

curl https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/deployment.yaml | \
    sed "s|gcr.io/k8s-staging-sig-storage/csi-provisioner:.*|${IMAGE_NAME}|g" | \
    kubectl apply -f -
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/rbac.yaml

kubectl rollout status deployment csi-provisioner --timeout=120s
