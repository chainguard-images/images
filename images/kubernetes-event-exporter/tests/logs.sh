#!/usr/bin/env bash

#
# Tests Keycloak can be started in production mode. This requires a keystore to
# be created and mounted into the Keycloak container image.
#

set -o errexit -o nounset -o errtrace -o pipefail -x

# Define log entries we are looking for in the keycloak logs here.
declare -a terms=(
  "Created container event-exporter"
  "Started container event-exporter"
)

declare -a missing_terms=()


start_container() {  
  helm install my-release \
      oci://registry-1.docker.io/bitnamicharts/kubernetes-event-exporter
  helm upgrade my-release \
      oci://registry-1.docker.io/bitnamicharts/kubernetes-event-exporter \
  --set image.registry="${IMAGE_REGISTRY}" \
  --set image.repository="${IMAGE_REPOSITORY}" \
  --set image.tag=latest
  sleep 15
}

search_logs() {
  local retries=10
  local delay=15

  for ((i=1; i<=retries; i++)); do
    local -r container_id=$(docker ps --format '{{.ID}}' --filter "name=my-release-kubernetes-event-exporter*")
    local logs=$(docker logs "${container_id}" 2>&1)
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
      sleep $delay:q
      
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
    # Create Keystore and launch Keycloak
    start_container
    local -r container_id=$(docker ps --format '{{.ID}}')
    trap "helm uninstall my-release" EXIT

    # Check if the container is running
    if ! docker ps --format '{{.Names}}' --filter "name=my-release-kubernetes-event-exporter*" | grep "my-release-kubernetes-event-exporter"; then
        echo "FAILED: Container kubernetes-event-exporter is not running."
        exit 1
    else
        echo "Container kubernetes-event-exporter is running."
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
