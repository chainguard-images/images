#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -x

WEBHOOK="prometheus-operator-kube-p-admission"

# Wait for all Prometheus Operator pods to be ready
kubectl get pods -l app.kubernetes.io/component=prometheus-operator
kubectl wait --for=condition=ready pod -l app.kubernetes.io/component=prometheus-operator --timeout=300s

# Check CA Bundle in Validating Webhook Configuration
VALIDATING_CA_BUNDLE=$(kubectl get validatingwebhookconfigurations.admissionregistration.k8s.io $WEBHOOK -o jsonpath="{.webhooks[0].clientConfig.caBundle}")
if [[ -z "$VALIDATING_CA_BUNDLE" ]]; then
  echo "'caBundle' was not present in validatingwebhookconfigurations: $WEBHOOK"
  exit 1
fi

# Check CA Bundle in Mutating Webhook Configuration
MUTATING_CA_BUNDLE=$(kubectl get mutatingwebhookconfigurations.admissionregistration.k8s.io $WEBHOOK -o jsonpath="{.webhooks[0].clientConfig.caBundle}")
if [[ -z "$MUTATING_CA_BUNDLE" ]]; then
  echo "'caBundle' was not present in mutatingwebhookconfigurations: $WEBHOOK"
  exit 1
fi

# Create a test PrometheusRule to trigger the webhook
cat <<EOF | kubectl apply -f -
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: test-rule
spec:
  groups:
  - name: example
    rules:
    - alert: TestAlert
      expr: vector(1)
      for: 5m
      labels:
        severity: warning
      annotations:
        summary: "This is a test alert"
EOF
sleep 10

# Check if the PrometheusRule resource was created successfully
if ! kubectl get prometheusrule test-rule; then
  exit 1
fi

# Check the logs of the Prometheus Operator pod to ensure it started correctly
OPERATOR_POD=$(kubectl get pods -l app.kubernetes.io/component=prometheus-operator -o jsonpath="{.items[0].metadata.name}")
LOGS=$(kubectl logs $OPERATOR_POD)

# Validate logs for expected entries
echo "$LOGS" | grep -q "Starting Prometheus Operator" || exit 1
echo "$LOGS" | grep -q "connection established" || exit 1
echo "$LOGS" | grep -q "successfully synced all caches" || exit 1
echo "$LOGS" | grep -q "sync prometheus" || exit 1

# Validate prometheus is runnin by checking the metrics endpoint is accessible
PROMETHEUS_POD=$(kubectl get pods -l app.kubernetes.io/name=prometheus -o jsonpath="{.items[0].metadata.name}")

kubectl exec $PROMETHEUS_POD -- sh -c 'wget -qO- http://localhost:9090/metrics | grep -q "# TYPE"' || exit 1
