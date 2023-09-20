#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The helm chart needs to be completely uninstalled between testing different versions
# This is because the Helm Chart creates cluster-level resources that need to be deleted and recreated (ClusterRole, APIService etc)
# otherwise Terraform spits out this error: `Unable to continue with install: APIService "v1beta1.custom.metrics.k8s.io" in namespace "" exists and cannot be imported into the current release: invalid ownership metadata`

helm uninstall prometheus-adapter --wait
