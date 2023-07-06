#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP="$(mktemp -d)"
pushd "${TMP}"

# This installs calico node, kube-controllers, and typha.
curl -o calico-typha.yaml https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico-typha.yaml
sed -i.bak "s|docker.io/calico/cni:.*|${CNI_IMAGE}|g" calico-typha.yaml
sed -i.bak "s|docker.io/calico/node:.*|${NODE_IMAGE}|g" calico-typha.yaml
sed -i.bak "s|docker.io/calico/kube-controllers:.*|${KUBE_CONTROLLERS_IMAGE}|g" calico-typha.yaml
sed -i.bak "s|docker.io/calico/typha:.*|${TYPHA_IMAGE}|g" calico-typha.yaml
kubectl apply -f calico-typha.yaml

curl -o calico-csi.yaml https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/csi-driver.yaml
sed -i.bak "s|docker.io/calico/csi:.*|${CSI_IMAGE}|g" calico-csi.yaml
sed -i.bak "s|docker.io/calico/node-driver-registrar:.*|${CSI_NODE_DRIVER_REGISTRAR_IMAGE}|g" calico-csi.yaml
kubectl apply -f calico-csi.yaml

kubectl rollout status daemonset calico-node -n kube-system --timeout 60s
kubectl rollout status deployment calico-kube-controllers -n kube-system --timeout 60s
kubectl rollout status deployment calico-typha -n kube-system --timeout 60s
kubectl rollout status daemonset csi-node-driver -n calico-system --timeout 60s
