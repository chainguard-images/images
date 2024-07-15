#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add jq curl

# Define variables
NAMESPACE="prometheus-operator"
PROMETHEUS_RELOADER_LABEL="app.kubernetes.io/instance=prometheus-config-reloader-prometheus"
PROMETHEUS_PORT=9090
PROMETHEUS_RULE_NAME="test-prometheusrule"

# Function to check if a Kubernetes resource is available
check_resource() {
    local resource_type=$1
    local label_selector=$2
    local jsonpath=$3
    local expected_value=$4

    echo "Checking $resource_type status..."
    local status=$(kubectl get $resource_type -n $NAMESPACE -l "$label_selector" -o jsonpath="$jsonpath")

    if [ "$status" == "$expected_value" ]; then
        echo "$resource_type is available."
    else
        echo "$resource_type is not available."
        exit 1
    fi
}

# Check if Prometheus Config Reloader pod is running
echo "Checking if Prometheus Config Reloader pod is running..."
RELOADER_POD=$(kubectl get pods -n $NAMESPACE -l "$PROMETHEUS_RELOADER_LABEL" -o jsonpath="{.items[0].metadata.name}")
if [ -z "$RELOADER_POD" ]; then
    echo "Prometheus Config Reloader pod is not running."
    exit 1
fi
echo "Prometheus Config Reloader pod is running: $RELOADER_POD"

# Get the Prometheus pod name
PROMETHEUS_POD=$(kubectl get pods -n $NAMESPACE -l "$PROMETHEUS_RELOADER_LABEL" -o jsonpath="{.items[0].metadata.name}")
if [ -z "$PROMETHEUS_POD" ]; then
    echo "Prometheus pod is not running."
    exit 1
fi
echo "Prometheus pod is running: $PROMETHEUS_POD"

# Port forward Prometheus port to localhost
kubectl port-forward -n $NAMESPACE $PROMETHEUS_POD $PROMETHEUS_PORT:$PROMETHEUS_PORT &
PORT_FORWARD_PID=$!
sleep 5

# Create a new PrometheusRule CRD
echo "Creating a new PrometheusRule CRD..."
cat <<EOF | kubectl apply -f -
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: $PROMETHEUS_RULE_NAME
  namespace: $NAMESPACE
  labels:
    release: prometheus-config-reloader
spec:
  groups:
  - name: test-group
    rules:
    - alert: TestAlert
      expr: vector(1)
      for: 1m
      labels:
        severity: warning
      annotations:
        summary: Test alert
EOF

# Wait for a few seconds to allow Prometheus to pick up the new rule
sleep 120

kubectl logs -n prometheus-operator --tail 500 $PROMETHEUS_POD -c config-reloader

# Check if the new PrometheusRule has been applied
echo "Checking if the new PrometheusRule has been applied..."
RELOADED_RULE=$(curl -s http://localhost:$PROMETHEUS_PORT/api/v1/rules | jq '.data.groups[] | select(.name == "test-group")')

if [ -z "$RELOADED_RULE" ]; then
    echo "New PrometheusRule has not been applied."
    curl -s http://localhost:$PROMETHEUS_PORT/api/v1/rules | jq '.data.groups[]'
    kill $PORT_FORWARD_PID
    kubectl delete prometheusrule $PROMETHEUS_RULE_NAME -n $NAMESPACE
    exit 1
else
    echo "New PrometheusRule has been successfully applied."
fi

# Clean up the PrometheusRule CRD
echo "Cleaning up the PrometheusRule CRD..."
kubectl delete prometheusrule $PROMETHEUS_RULE_NAME -n $NAMESPACE

# Kill the port-forward process
kill $PORT_FORWARD_PID

echo "All checks and updates passed successfully."

exit 0