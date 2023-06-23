#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

app_name="kube-bench"
tmp="$(mktemp -d 'kube-bench-test-XXXXXX')"

function cleanup() {
    rm -rf "$tmp"

    # Print debug logs and status
    kubectl get pods
    kubectl describe pods
    kubectl logs -l app="${app_name}"
}

trap cleanup EXIT

# Retrieve the upstream-recommended job.yaml
job_file="$tmp/job.yaml"

curl -sSL -o "$job_file" 'https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml'

# Update the config to use our image
yq -i ".spec.template.spec.containers[0].image |= \"${IMAGE_NAME}\"" "$job_file"

kubectl apply -f "$job_file"

# Wait for job to complete
kubectl wait --for=condition=complete job.batch/kube-bench --timeout=30s
