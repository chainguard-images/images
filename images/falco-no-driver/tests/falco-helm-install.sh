#!/usr/bin/env bash

#
# Tests falco with its helm chart and reviews the logs
# to ensure expected behaviour
#
# This helm installation may fail on some mac devices
# It is itended to run on linux systems.

set -o errexit -o nounset -o errtrace -o pipefail -x

# Defining log entries we are looking for in the k8s-event-export logs
declare -a terms=(
  "Opening 'syscall' source with modern BPF probe"
)

declare -a missing_terms=()


start_container() {
  namespace="falco"
  installation="falco"
  pod_name="falco"

  helm repo add falcosecurity https://falcosecurity.github.io/charts
  helm repo update

  helm install $installation \
  --namespace $namespace --create-namespace  \
  --set image.registry="${IMAGE_REGISTRY}" \
  --set image.repository="${IMAGE_REPOSITORY}" \
  --set image.tag=${IMAGE_TAG} \
  --set driver.kind=modern-bpf \
  --wait falcosecurity/falco
}

search_logs() {
  local retries=10
  local delay=15

  for ((i=1; i<=retries; i++)); do
    local logs=$(kubectl logs pods/$(kubectl get pods -n $namespace | grep 'Running' | awk '{print $1}') -n $namespace 2>&1)
    local all_terms_found=true

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
    # Install falco using the helm chart and the image we built
    start_container
    local -r container_id=$(docker ps --format '{{.ID}}')

    # Clear up the resources on exiting
    trap "helm uninstall $installation -n $namespace" EXIT

    # Check if the container is running
    if ! kubectl get pods -n $namespace | grep 'falco-'; then
        echo "FAILED: Pod $pod_name is not running."
        exit 1
    else
        echo "Pod $pod_name is running."
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
