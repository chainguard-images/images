#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-azure-authorization
spec:
  package: ${AUTHORIZATION_DIGEST}
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-azure-managedidentity
spec:
  package: ${MANAGEDIDENTITY_DIGEST}
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-azure-sql
spec:
  package: ${SQL_DIGEST}
EOF

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-azure-storage
spec:
  package: ${STORAGE_DIGEST}
EOF

for provider in authorization managedidentity sql storage; do
  kubectl wait --for=condition=Installed "provider/provider-azure-${provider}" --timeout=3m
  kubectl wait --for=condition=Healthy   "provider/provider-azure-${provider}" --timeout=5m
done

# Update the Azure family provider that was installed by the above providers as a dependency, to use our Azure family provider instead.

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: upbound-provider-family-azure
spec:
  package: ${AZURE_DIGEST}
EOF

kubectl wait --for=condition=Installed provider/upbound-provider-family-azure --timeout=3m
kubectl wait --for=condition=Healthy   provider/upbound-provider-family-azure --timeout=5m
