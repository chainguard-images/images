#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

cat >deploy.yaml <<EOF
---
apiVersion: v1
kind: Namespace
metadata:
  name: redis
---
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: redis
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

kubectl apply -f deploy.yaml -n redis

kubectl wait --for=condition=ready pod --selector app=redis -n redis

latest_pod_name="$(kubectl get pods --selector app=redis -n redis -o jsonpath="{.items[0].metadata.name}")"
kubectl port-forward "pod/${latest_pod_name}" 9121:9121 -n redis &


pid=$!
trap "kill $pid" EXIT
sleep 10
curl localhost:9121/metrics | grep "redis_up 1"

