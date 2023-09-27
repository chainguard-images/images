#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

VERSION=${VERSION:-v1.9.0}
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-resizer/${VERSION}/deploy/kubernetes/rbac.yaml
curl https://raw.githubusercontent.com/kubernetes-csi/external-resizer/${VERSION}/deploy/kubernetes/deployment.yaml \
    | sed "s|gcr.io/k8s-staging-sig-storage/csi-resizer:.*|${IMAGE_NAME}|g" \
    | kubectl apply -f -

kubectl rollout status deployment csi-resizer --timeout=120s
