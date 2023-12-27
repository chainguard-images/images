#!/usr/bin/env bash
#
# Tests vector with its helm chart and reviews the logs
# to ensure expected behaviour
#

set -o errexit -o nounset -o errtrace -o pipefail -x

# Defining log entries we are looking for in the vector logs
declare -a terms=(
   "Healthcheck passed"
   "Vector has started"
)

declare -a missing_terms=()


start_container() {
namespace="vector"
installation="vector"
pod_name="vector"

helm repo add vector https://helm.vector.dev

helm install $installation \
   --namespace $namespace --create-namespace \
   --set image.repository="${IMAGE_REGISTRY}"/"${IMAGE_REPOSITORY}" \
   --set image.tag="latest" \
   --wait \
   vector/vector 
}


search_logs() {
  local retries=10
  local delay=15

  for ((i=1; i<=retries; i++)); do
    local logs=$(kubectl logs pods/$(kubectl get pods -n "$namespace" | grep "$pod_name" | awk '{print $1}') -n "$namespace" 2>&1)
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
    # Install vector using the helm chart and the image we built
    start_container
    local -r container_id=$(docker ps --format '{{.ID}}')

    # Clear up the resources on exiting
    trap "helm uninstall "$installation" -n '$namespace'" EXIT

    # Check if the container is running
    echo $(kubectl describe pods/$(kubectl get pods -n '$namespace' | grep "$pod_name" | awk '{print $1}') -n '$namespace')
    if ! kubectl get pods -n "$namespace" | grep "$pod_name"; then
        echo "FAILED: "$installation" pods is not running."
        exit 1
    else
        echo "Pod "$installation" is running."
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
