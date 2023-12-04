#!/usr/bin/env bash

#
# Tests Keycloak can be started in production mode. This requires a keystore to
# be created and mounted into the Keycloak container image.
#

set -o errexit -o nounset -o errtrace -o pipefail -x

KEYCLOAK_HOSTNAME="localhost"
KEYCLOAK_PORT=$FREE_PORT
KEYCLOAK_URL="https://$KEYCLOAK_HOSTNAME:$KEYCLOAK_PORT"
KEYSTORE_PATH="/tmp/server.keystore"
KEYSTORE_PASSWORD="placeholder"

# Define log entries we are looking for in the keycloak logs here.
declare -a terms=(
  "Listening on: https://0.0.0.0:8443"
  "Profile prod activated"
)

declare -a missing_terms=()

create_keystore() {  
  rm -rf "$KEYSTORE_PATH"
  keytool -v -keystore $KEYSTORE_PATH \
    -alias $KEYCLOAK_HOSTNAME \
    -genkeypair -sigalg SHA512withRSA -keyalg RSA \
    -dname CN=$KEYCLOAK_HOSTNAME \
    -storepass $KEYSTORE_PASSWORD
}

start_container() {  
  docker run \
    -v "$KEYSTORE_PATH:/usr/share/java/keycloak/conf/server.keystore" \
    --detach --rm \
    --name local-keycloak -p $KEYCLOAK_PORT:8443 \
    -e KEYCLOAK_ADMIN=admin \
    -e KEYCLOAK_ADMIN_PASSWORD=$KEYSTORE_PASSWORD \
    "${IMAGE_NAME}" \
    start \
    --hostname=$KEYCLOAK_HOSTNAME \
    --https-key-store-password=$KEYSTORE_PASSWORD
  sleep 15
}

search_logs() {
  local retries=10
  local delay=15

  for ((i=1; i<=retries; i++)); do
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
    # Create Keystore and launch Keycloak
    create_keystore
    local -r container_id=$(start_container)
    trap "docker stop ${container_id} && rm -rf ${KEYSTORE_PATH}" EXIT

    # Check if the container is running
    if ! docker ps --filter "name=local-keycloak" --format '{{.Names}}' | grep -q "^local-keycloak$"; then
        echo "FAILED: Container local-keycloak is not running."
        exit 1
    else
        echo "Container local-keycloak is running."
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