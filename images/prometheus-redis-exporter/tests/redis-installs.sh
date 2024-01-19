#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

ns=redis-${FREE_PORT}

kubectl apply -f - <<EOF
---
apiVersion: v1
kind: Namespace
metadata:
  name: $ns
---
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: $ns
  name: redis
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "9121"
      labels:
        app: redis
    spec:
      containers:
      - name: redis
        image: cgr.dev/chainguard/redis:latest
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        ports:
        - containerPort: 6379
      - name: redis-exporter
        image: ${IMAGE_NAME}
        securityContext:
          runAsUser: 65532
          runAsGroup: 65532
          allowPrivilegeEscalation: false
          capabilities:
            drop:
            - ALL
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        ports:
        - containerPort: 9121
EOF

kubectl rollout status --timeout 5m -n $ns deployment/redis
kubectl wait --for=condition=ready pod --selector app=redis -n $ns

latest_pod_name="$(kubectl get pods --selector app=redis -n $ns -o jsonpath="{.items[0].metadata.name}")"
kubectl port-forward "pod/${latest_pod_name}" ${FREE_PORT}:9121 -n $ns &

pid=$!
trap "kill $pid" EXIT
sleep 10
curl localhost:${FREE_PORT}/metrics | grep "redis_up 1"
