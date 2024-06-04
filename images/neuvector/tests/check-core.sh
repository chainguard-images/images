#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Parameters
NAMESPACE="neuvector"
NODE_PORT=$(shuf -i 1024-65535 -n 1)
NODE_IMAGE="node"

# Wait for deployment
kubectl rollout status deployment/neuvector-manager-pod -n "${NAMESPACE}"
kubectl rollout status deployment/neuvector-scanner-pod -n "${NAMESPACE}"
kubectl rollout status deployment/neuvector-controller-pod -n "${NAMESPACE}"

# Create node namespace
kubectl create namespace node

# Deploy Nodejs
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: node
  namespace: $NAMESPACE
spec:
  ports:
  - port: $NODE_PORT
    protocol: TCP
    name: "cluster-tcp-$NODE_PORT"
  clusterIP: None
  selector:
    app: node-pod

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-pod
  namespace: node
spec:
  selector:
    matchLabels:
      app: node-pod
  replicas: 3
  template:
    metadata:
      labels:
        app: node-pod
    spec:
      containers:
      - name: node-pod
        image: $NODE_IMAGE
        command: ["node", "-e", "require('http').createServer((req, res) => res.end('Hello World')).listen(8888)"]
EOF

# Wait for demo deployments to be ready
kubectl rollout status deployment/node-pod -n node

# Generate Network Violations
NODE_POD=$(kubectl get pod -n node -l app=node-pod -o jsonpath='{.items[0].metadata.name}')
kubectl exec $NODE_POD -n node -- curl www.google.com

INTERNAL_NODE_IP=$(kubectl get pod -n node -l app=node-pod -o jsonpath='{.items[1].status.podIP}')
kubectl exec $NODE_POD -n node -- curl $INTERNAL_NODE_IP:$NODE_PORT

# Simulate an attack
kubectl exec -it $NODE_POD -n node -- bash -c "ping $INTERNAL_NODE_IP -s 40000 -c 10"

# Cleanup
kubectl delete namespace node
