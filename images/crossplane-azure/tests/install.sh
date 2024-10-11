#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

declare -A providerDigests=(
  [authorization]=${AUTHORIZATION_DIGEST}
  [managedidentity]=${MANAGEDIDENTITY_DIGEST}
  [sql]=${SQL_DIGEST}
  [storage]=${STORAGE_DIGEST}
)

cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: upbound-provider-family-azure
spec:
  package: ${AZURE_DIGEST}
  revisionHistoryLimit: 0
  ignoreCrossplaneConstraints: true
  packagePullSecrets:
  - name: regcred
EOF

kubectl wait --for=condition=Installed provider/upbound-provider-family-azure --timeout=10m
kubectl wait --for=condition=Healthy provider/upbound-provider-family-azure --timeout=10m

for provider in "${!providerDigests[@]}"; do
  digest="${providerDigests[$provider]}"

  cat <<EOF | kubectl apply -f -
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-azure-${provider}
spec:
  package: ${digest}
  # The providers seem to hardcode their dependency on the upstream
  # upbound-provider-family-azure reference. Since we're using our own, we
  # disable this check.
  skipDependencyResolution: true
  # Delete the revision history to save space
  revisionHistoryLimit: 0
  # We use pseudo_tags for the provider images, so we need to ignore the semver
  # checks.
  ignoreCrossplaneConstraints: true
  packagePullSecrets:
  - name: regcred
EOF
done

for provider in "${!providerDigests[@]}"; do
  kubectl wait --for=condition=Installed "provider/provider-azure-${provider}" --timeout=10m
  kubectl wait --for=condition=Healthy "provider/provider-azure-${provider}" --timeout=10m
done
