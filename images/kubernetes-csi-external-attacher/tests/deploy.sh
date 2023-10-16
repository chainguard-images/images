#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

: "${NAMESPACE:=default}"
kubectl create ns $NAMESPACE || true
trap "kubectl delete ns $NAMESPACE" EXIT

curl https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/deployment.yaml \
    | sed "s|registry.k8s.io/k8s-staging-sig-storage/csi-attacher:.*|${IMAGE_NAME}|g" \
    | kubectl apply -n $NAMESPACE -f -

curl https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/rbac.yaml \
    | sed "s|namespace: default|namespace: $NAMESPACE|g" \
    | sed "s|csi-attacher-role|csi-attacher-role-$NAMESPACE|g" \
    | sed "s|external-attacher-runner|external-attacher-runner-$NAMESPACE|g" \
    | kubectl apply -n $NAMESPACE -f -

sleep 5

kubectl rollout status deployment -n $NAMESPACE csi-attacher --timeout=120s
