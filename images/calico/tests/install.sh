#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP="$(mktemp -d)"
pushd "${TMP}"

curl -o calico.yaml https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml

sed -i.bak "s|docker.io/calico/node:.*|${NODE_IMAGE}|g" calico.yaml
sed -i.bak "s|docker.io/calico/kube-controllers:.*|${KUBE_CONTROLLERS_IMAGE}|g" calico.yaml
sed -i.bak "s|docker.io/calico/cni:.*|${CNI_IMAGE}|g" calico.yaml

kubectl apply -f calico.yaml

kubectl rollout status daemonset calico-node -n kube-system --timeout 60s
kubectl rollout status deployment calico-kube-controllers -n kube-system --timeout 60s
