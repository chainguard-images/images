#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# Deploys LocalStack into a Kubernetes namespace and waits for the requested
# AWS services to become available. Intended to run as a k3s-in-docker test
# step — all configuration is passed via environment variables set by the
# Terraform module.
#
# After this script completes:
#   - LocalStack is running at http://localstack.$NS.svc.cluster.local:4566
#   - A "localstack-credentials" Secret exists with access-key/secret-key
#   - All requested SERVICES report "available" or "running" in the health API

source ../libs/libs.sh

NS="${LOCALSTACK_NAMESPACE}"
SERVICES="${LOCALSTACK_SERVICES}"
WAIT_ATTEMPTS="${LOCALSTACK_WAIT_ATTEMPTS}"
WAIT_DELAY="${LOCALSTACK_WAIT_DELAY}"

# Deploy LocalStack Deployment + Service
SCRIPT_DIR="$(dirname "$0")"
envsubst < "${SCRIPT_DIR}/deployment.yaml" | kubectl apply -f -

# Wait for the deployment to become available
kubectl wait --for=condition=available "deployment/localstack" -n "${NS}" --timeout=120s

# Wait for each requested service to appear in the health endpoint.
# LocalStack's /_localstack/health returns JSON like:
#   {"services": {"s3": "available", "sqs": "running", ...}}
#
# Both "available" and "running" indicate the service is ready.
IFS=',' read -ra SVC_LIST <<< "${SERVICES}"
for svc in "${SVC_LIST[@]}"; do
  svc=$(echo "$svc" | xargs)  # trim whitespace
  shu retry --attempts "${WAIT_ATTEMPTS}" --delay "${WAIT_DELAY}" --fixed-delay -- \
    sh -c "kubectl exec deployment/localstack -n ${NS} -- \
      curl -sf http://localhost:4566/_localstack/health \
      | grep -qE '\"${svc}\"[[:space:]]*:[[:space:]]*\"(available|running)\"'"
done

# Create a credentials Secret so downstream tests can reference it
kubectl create secret generic localstack-credentials \
  --from-literal=access-key=test \
  --from-literal=secret-key=test \
  --namespace="${NS}" \
  --dry-run=client -o yaml | kubectl apply -f -
