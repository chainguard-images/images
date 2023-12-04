#!/usr/bin/env bash

set -euxo pipefail

rand=$1
name=spire-${rand}
ns=spire-system-${rand}

function cleanup() {
    # Uninstall everything, and make double triple sure it's fully uninstalled.
    helm uninstall ${name} -n ${ns} --wait --cascade=foreground
    helm uninstall ${name}-crds -n ${ns} --wait --cascade=foreground

    kubectl delete pods -n ${ns} --all --wait=true
    kubectl delete ns ${ns} --wait=true

    for crd in $(kubectl get crds -o name | grep spire); do
        kubectl delete $crd
        kubectl wait --for=delete $crd --timeout=120s
    done
}
trap cleanup EXIT

cat /tmp/crd-values-${rand}.yaml
cat /tmp/values-${rand}.yaml

helm install ${name}-crds spire-crds -n ${ns} --repo https://spiffe.github.io/helm-charts-hardened/ -f /tmp/crd-values-${rand}.yaml --create-namespace
helm install ${name} spire      -n ${ns} --repo https://spiffe.github.io/helm-charts-hardened/ -f /tmp/values-${rand}.yaml

# Wait for the pods to be ready.
kubectl wait --for=condition=Ready -n ${ns} pod --all --timeout=120s
