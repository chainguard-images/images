#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

app_name="kube-bench"
tmp="$(mktemp -d)"

# Retrieve the upstream-recommended job.yaml
job_file="$tmp/job.yaml"

curl -sSL -o "$job_file" 'https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml'

# Update the config to use our image
yq -i ".spec.template.spec.containers[0].image |= \"${IMAGE_NAME}\"" "$job_file"

ns=kube-bench-${RANDOM}
kubectl create ns "$ns"
kubectl apply -f "$job_file" -n $ns

# Wait for job to complete
kubectl wait --for=condition=complete job.batch/kube-bench --timeout=30s -n $ns
