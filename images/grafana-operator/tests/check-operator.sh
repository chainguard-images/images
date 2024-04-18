#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

NAMESPACE="grafana-operator"
RESOURCE="grafana-operator"

# Generic function for retrieving latest APK version in Wolfi
get_apk_ver() {
  apk search $1 | sed "s/$1-//" | sed "s/-r[0-9].*//"
}

# Install and deploy Helm chart
deploy_helm_chart() {
  # Install Helm
  apk add helm

  # Fetch chart version
  chart_ver=$(get_apk_ver grafana-operator)

  # Create namespace
  kubectl create ns grafana-operator

  # Install and deploy Helm chart
  helm upgrade \
    -n "${NAMESPACE}" \
    -i "${RESOURCE}" oci://ghcr.io/grafana/helm-charts/grafana-operator \
    --version v"${chart_ver}" \
    --set image.repository="${IMAGE_NAME}" \
    --set image.tag="${IMAGE_TAG}"
}

# Deploy dashboard
deploy_dashboard() {
  # Install wget to retrieve resources
  apk add wget

  # Fetch and deploy dashboard
  wget https://raw.githubusercontent.com/grafana/grafana-operator/master/examples/basic/resources.yaml -O dash.yaml
  kubectl apply -n "${NAMESPACE}" -f dash.yaml
  sleep 15 # Provides buffer for resources to apply

  # Wait for all pods to be ready (confirms operator functionality)
  kubectl wait pod -n "${NAMESPACE}" --all --for=condition=Ready
}

deploy_helm_chart
deploy_dashboard
