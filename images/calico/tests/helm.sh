#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

helm repo add projectcalico https://docs.tigera.io/calico/charts
helm upgrade --install calico projectcalico/tigera-operator \
    --namespace tigera-operator \
    --create-namespace \
    --wait

sleep 3
kubectl set image daemonset/calico-node calico-node=${IMAGE_NAME} -n calico-system
kubectl rollout status daemonset calico-node -n calico-system --timeout 60s
