#!/usr/bin/env bash

set -euxo pipefail

rand=$1
name=tigera-operator-${rand}
ns=tigera-operator-${rand}

function cleanup() {
    # Uninstall everything, and make double triple sure it's fully uninstalled.
    helm uninstall ${name} -n ${ns} --wait --cascade=foreground --timeout=10m

    kubectl delete pods -n ${ns} --all --wait=true
    kubectl delete ns ${ns} --wait=true

    for crd in $(kubectl get crds -o name | grep tigera); do
        kubectl delete $crd
        kubectl wait --for=delete $crd --timeout=120s
    done
}
trap cleanup EXIT

cat /tmp/values-${rand}.yaml

helm install ${name} tigera-operator -n ${ns} --repo https://docs.tigera.io/calico/charts -f /tmp/values-${rand}.yaml --create-namespace --version=3.26.4

# Wait for the pods to be ready.
kubectl wait --for=condition=Ready -n ${ns} pod --all --timeout=120s
