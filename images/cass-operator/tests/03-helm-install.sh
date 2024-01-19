#!/usr/bin/env bash
#
# Tests cass-operator with its helm chart and reviews the logs
# to ensure expecyed behaviour
#

set -o errexit -o nounset -o errtrace -o pipefail -x

# Defining log entries we are looking for in the cass-operator logs
declare -a terms=(
   "Starting EventSource"
   "Starting Controller"
   "Starting workers"
)

declare -a missing_terms=()


start_container() {
namespace="cass-operator"  
helm repo add jetstack https://charts.jetstack.io
helm repo add k8ssandra https://helm.k8ssandra.io/stable

helm install cert-manager \
    --namespace "$namespace" \
    --create-namespace \
    --set installCRDs=true \
    --wait \
    jetstack/cert-manager

helm install cass-operator \
    -n "$namespace" \
    --set image.registry=${IMAGE_REGISTRY} \
    --set image.repository=${IMAGE_REPOSITORY} \
    --set image.tag=${IMAGE_TAG} \
    --wait \
    k8ssandra/cass-operator
}


search_logs() {
  local retries=10
  local delay=15

  for ((i=1; i<=retries; i++)); do
    local logs=$(kubectl logs pods/$(kubectl get pods -n cass-operator | grep 'cass-operator' | awk '{print $1}') -n cass-operator 2>&1)
    local all_terms_found=true

    echo "$logs"

    for term in "${terms[@]}"; do
      if echo "$logs" | grep -Fq "$term"; then
        echo "Found log term: $term"
      else
        echo "Log term NOT found: $term (attempt $i of $retries)"
        all_terms_found=false
      fi
    done

    if $all_terms_found; then
      return 0
    elif [[ $i -lt $retries ]]; then
      echo "Some log terms were missing. Retrying in $delay seconds..."
      sleep $delay
      
    fi
  done

  # After all retries, record the missing terms
  for term in "${terms[@]}"; do
    if ! echo "$logs" | grep -Fq "$term"; then
      missing_terms+=("$term")
    fi
  done

  echo "FAILED: After $retries attempts, the following terms were not found:"
  printf '%s\n' "${missing_terms[@]}"
  exit 1
}

TEST_container_starts_ok() {
    # Install cass-operator using the helm chart and the image we built
    start_container
    local -r container_id=$(docker ps --format '{{.ID}}')

    # Clear up the resources on exiting
    trap "helm uninstall cass-operator -n cass-operator; helm uninstall cert-manager -n cass-operator" EXIT

    # Check if the container is running
    if ! kubectl get pods -n "$namespace" | grep 'cass-operator-'; then
        echo "FAILED: Pod cass-operator is not running."
        exit 1
    else
        echo "Pod cass-operator is running."
    fi

    # Look for each log term. Will record any which are not found.
    search_logs

    if [[ ${#missing_terms[@]} -ne 0 ]]; then
        echo "The following terms were not found:"
        printf '%s\n' "${missing_terms[@]}"
        exit 1
    fi
}

TEST_container_starts_ok

