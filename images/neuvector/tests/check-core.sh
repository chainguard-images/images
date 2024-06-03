#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Parameters
NAMESPACE="neuvector"
RELEASE_NAME="core"

# Set variables
NAMESPACE="demo"
NEUVECTOR_NAMESPACE="neuvector"
NGINX_PORT=80
NODE_PORT=8888
REDIS_PORT=6379
NGINX_IMAGE="nvbeta/swarm_nginx"
NODE_IMAGE="node:14"
REDIS_IMAGE="redis"

# Wait for deployment
kubectl rollout status deployment/neuvector-manager-pod -n "${NEUVECTOR_NAMESPACE}"
kubectl rollout status deployment/neuvector-scanner-pod -n "${NEUVECTOR_NAMESPACE}"
kubectl rollout status deployment/neuvector-controller-pod -n "${NEUVECTOR_NAMESPACE}"

# Create demo namespace
kubectl create namespace $NAMESPACE

# Deploy Redis
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: redis
  namespace: $NAMESPACE
spec:
  ports:
  - port: $REDIS_PORT
    protocol: TCP
    name: "cluster-tcp-$REDIS_PORT"
  clusterIP: None
  selector:
    app: redis-pod

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-pod
  namespace: $NAMESPACE
spec:
  selector:
    matchLabels:
      app: redis-pod
  template:
    metadata:
      labels:
        app: redis-pod
    spec:
      containers:
      - name: redis-pod
        image: $REDIS_IMAGE
EOF

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
  namespace: $NAMESPACE
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

# Deploy Nginx
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: nginx-webui
  namespace: $NAMESPACE
spec:
  ports:
    - port: $NGINX_PORT
      name: webui
      protocol: TCP
  type: NodePort
  selector:
    app: nginx-pod

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-pod
  namespace: $NAMESPACE
spec:
  selector:
    matchLabels:
      app: nginx-pod
  template:
    metadata:
      labels:
        app: nginx-pod
    spec:
      containers:
      - name: nginx-pod
        image: $NGINX_IMAGE
        ports:
        - containerPort: $NGINX_PORT
          protocol: TCP
EOF

# Wait for demo deployments to be ready
kubectl rollout status deployment/redis-pod -n $NAMESPACE
kubectl rollout status deployment/node-pod -n $NAMESPACE
kubectl rollout status deployment/nginx-pod -n $NAMESPACE

# Get the NodePort for the Nginx service
NGINX_NODE_PORT=$(kubectl get svc nginx-webui -n $NAMESPACE -o jsonpath='{.spec.ports[0].nodePort}')

# Generate Network Violations
NODE_POD=$(kubectl get pod -n $NAMESPACE -l app=node-pod -o jsonpath='{.items[0].metadata.name}')
kubectl exec $NODE_POD -n $NAMESPACE -- curl www.google.com
INTERNAL_NODE_IP=$(kubectl get pod -n $NAMESPACE -l app=node-pod -o jsonpath='{.items[1].status.podIP}')
kubectl exec $NODE_POD -n $NAMESPACE -- curl $INTERNAL_NODE_IP:$NODE_PORT

# Simulate an attack
kubectl exec -it $NODE_POD -n $NAMESPACE -- bash -c "ping $INTERNAL_NODE_IP -s 40000 -c 10"

# Cleanup
kubectl delete namespace $NAMESPACE
