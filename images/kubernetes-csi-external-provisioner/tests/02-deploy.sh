#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

# Deploy the csi-provisioner yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/rbac.yaml
curl -LO https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/deployment.yaml
kubectl set image csi-provisioner=${IMAGE_NAME} --local -o yaml -f deployment.yaml | kubectl apply -f -

# Check the csi-provisioner pods are deployed and healthy
kubectl wait --for=condition=ready pod --selector app=csi-provisioner --timeout=120s
