#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# installation instruction from here https://bank-vaults.dev/docs/installing/

kubectl config set-context --current --namespace=default

helm upgrade --install --wait vault-operator oci://ghcr.io/bank-vaults/helm-charts/vault-operator \
    --set bankVaults.image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
    --set bankVaults.image.tag=$IMAGE_TAG

kubectl kustomize https://github.com/bank-vaults/vault-operator/deploy/rbac | kubectl apply -f -

kubectl apply -f https://raw.githubusercontent.com/bank-vaults/vault-operator/v1.21.0/deploy/examples/cr-raft.yaml
    
kubectl wait pods -n default -l "app.kubernetes.io/name=vault" --for=condition=Ready --timeout=300s
