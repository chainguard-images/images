#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Dump logs on exit
trap "kubectl logs -n neuvector --selector app=neuvector-prometheus-exporter-pod" EXIT

# Wait for deployment
kubectl rollout status -n neuvector deployment/neuvector-prometheus-exporter-pod

# Test metrics
apk add curl prometheus
kubectl port-forward -n neuvector svc/neuvector-prometheus-exporter 8068 &
until curl -L http://localhost:8068; do sleep 1; done
curl -s http://localhost:8068 | promtool check metrics || [ $? -eq 3 ] # Exit code 3 is a lint error
