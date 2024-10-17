#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

dump_logs() {
  kubectl logs deployment/neuvector-manager-pod -n neuvector
  kubectl logs deployment/neuvector-scanner-pod -n neuvector
  kubectl logs deployment/neuvector-controller-pod -n neuvector
}

trap "dump_logs" EXIT

# Parameters
NAMESPACE="neuvector"
TEST_PORT=$(shuf -i 1024-65535 -n 1)
TEST_IMAGE="wolfi"

# Wait for deployment
kubectl rollout status deployment/neuvector-manager-pod -n "${NAMESPACE}"
kubectl rollout status deployment/neuvector-scanner-pod -n "${NAMESPACE}"
kubectl rollout status deployment/neuvector-controller-pod -n "${NAMESPACE}"

# Create test namespace
kubectl create namespace test

# Deploy test
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: $TEST_IMAGE
  namespace: test
spec:
  ports:
  - port: $TEST_PORT
    protocol: TCP
    name: "cluster-tcp-$TEST_PORT"
  clusterIP: None
  selector:
    app: $TEST_IMAGE-pod

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $TEST_IMAGE-pod
  namespace: test
spec:
  selector:
    matchLabels:
      app: $TEST_IMAGE-pod
  replicas: 2
  template:
    metadata:
      labels:
        app: $TEST_IMAGE-pod
    spec:
      containers:
      - name: $TEST_IMAGE-pod
        image: cgr.dev/chainguard/curl:latest-dev
        command: ["sleep", "infinity"]
        securityContext:
          runAsUser: 0
          runAsGroup: 0
EOF

# Wait for test deployment to be ready
kubectl rollout status deployment/"${TEST_IMAGE}"-pod -n test

# Generate network violations
TEST_POD=$(kubectl get pod -n test -l app="${TEST_IMAGE}"-pod -o jsonpath='{.items[0].metadata.name}')
kubectl exec $TEST_POD -n test -- curl www.google.com || true

# Simulate an attack
INTERNAL_TEST_IP=$(kubectl get pod -n test -l app="${TEST_IMAGE}"-pod -o jsonpath='{.items[1].status.podIP}')
kubectl exec -i $TEST_POD -n test -- bash -c "ping $INTERNAL_TEST_IP -s 40000 -c 10" || true

# Check for broadcast
kubectl logs daemonset/neuvector-enforcer-pod -n "${NAMESPACE}" | grep "AGT|main.parseHostAddrs: link - flags=up|broadcast|multicast"

# Validate stream sent and received
kubectl logs deployment/neuvector-scanner-pod -n "${NAMESPACE}" | grep "Stream send done"
kubectl logs deployment/neuvector-controller-pod -n "${NAMESPACE}" | grep "Stream receive"

# Cleanup
kubectl delete namespace test --cascade='background' --grace-period=1
