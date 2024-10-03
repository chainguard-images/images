#!/bin/bash

set -o errexit -o nounset -o errtrace -o pipefail

echo "Starting port-forwarding..."
kubectl port-forward svc/gitlab-exporter-service 9168:9168 2>&1 &

echo "Waiting for port-forward to be ready..."
sleep 5  # Adjust this if necessary

echo "Testing gitlab-exporter Metrics Endpoint..."

if ! response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9168/metrics); then
  echo "Curl command failed"
  exit 1
fi

if [ "$response" -ne 200 ]; then
  echo "Metrics endpoint is not accessible, HTTP code $response"
  exit 1
else
  echo "Metrics endpoint is accessible"
fi

echo "Validating Specific Metrics..."

metrics=$(curl -s http://localhost:9168/metrics)
required_metrics=("gitlab_database_rows" "sidekiq_jobs_processed_total")

for metric in "${required_metrics[@]}"; do
  if echo "$metrics" | grep -q "$metric"; then
    echo "Metric $metric found"
  else
    echo "Metric $metric not found"
    exit 1
  fi
done

echo "All required metrics are present."