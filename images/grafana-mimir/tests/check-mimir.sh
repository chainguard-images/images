#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Use random port
METRICS_PORT=$(shuf -i 1024-65535 -n 1)

# Cleanup and dump deployment logs
cleanup() {
  if [[ -d /tmp/agent-"${METRICS_PORT}" ]]; then
    rm -rf /tmp/agent-"${METRICS_PORT}"
  fi
  kubectl logs -n "${NAMESPACE}" deployment/mimir-distributor
}

# Dump logs on exit
trap "cleanup" EXIT

# Write resource
cat > /tmp/custom.yaml << EOF
metaMonitoring:
  serviceMonitor:
    enabled: true
  grafanaAgent:
    enabled: true
    installOperator: true
    metrics:
      additionalRemoteWriteConfigs:
        - url: "http://mimir-nginx.${NAMESPACE}.svc:80/api/v1/push"
EOF

# Validate that API is available
check_api() {
  # Install curl and jq
  apk add curl jq

  # Forward port
  kubectl port-forward -n "${NAMESPACE}" service/mimir-distributor "${METRICS_PORT}":8080 & sleep 5

  # Check API status
  if [[ $(curl -vsL localhost:"${METRICS_PORT}"/api/v1/status/config | jq -r .status) != "success" ]]; then
    echo "Failed to retrieve API status" && exit 1
  fi
}

# Deploy agent
deploy_agent() {
  # Install git
  apk add git

  # Clone and install CRDs
  git clone https://github.com/grafana/agent /tmp/agent-"${METRICS_PORT}"
  kubectl create -f /tmp/agent-"${METRICS_PORT}"/operations/agent-static-operator/crds/

  # Add repo and upgrade
  helm repo add grafana https://grafana.github.io/helm-charts
  helm repo update

  # Deploy agent and populate metrics
  helm -n "${NAMESPACE}" upgrade "${NAME}" grafana/mimir-distributed -f /tmp/custom.yaml

  # Wait for grafana agent rollout to complete
  kubectl rollout -n "${NAMESPACE}" status deployment mimir-grafana-agent-operator

  # Verify metrics server started successfully
  if ! kubectl logs -n "${NAMESPACE}" deployment/mimir-grafana-agent-operator 2>&1 | grep "Serving metrics server"; then
    echo "Failed to start metrics server" && exit 1
  fi
}

# Ensure metrics exist
validate_metrics() {
  if [[ -z $(curl -vsL localhost:"${METRICS_PORT}"/metrics) ]]; then
    echo "No metrics found" && exit 1
  fi
}

# Run tests
check_api
deploy_agent
validate_metrics
