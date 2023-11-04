#!/usr/bin/env bash

#
# Tests Keycloak in production mode. This requires a keystore to be created
# and mounted into the Keycloak container image.
#
# Validation includes ensuring Keycloak is running, and that we can authenticate
# with the API to retrieve a list of users.
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
}

search_logs() {
  local retries=6
  local delay=15 # seconds

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

keycloak_api_get_users() {
    local max_attempts=10
    local attempt=10
    local success=false

    while (( attempt <= max_attempts )); do
        echo "Attempt $attempt of $max_attempts"

        # Get Keycloak access token
        local response=$(curl -k -s -w "\nHTTP_STATUS_CODE:%{http_code}\n" -X POST $KEYCLOAK_URL/realms/master/protocol/openid-connect/token \
            --user admin-cli:Psip5UvTO1EXUEwzb15nxLWnwdU1Nlcg \
            -H 'content-type: application/x-www-form-urlencoded' \
            -d "username=admin&password=$KEYSTORE_PASSWORD&grant_type=password")

        local response_code=$(echo "$response" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
        local content=$(echo "$response" | sed '/HTTP_STATUS_CODE/d')

        if [[ "$response_code" == "200" ]]; then
            local access_token=$(echo "$content" | jq --raw-output '.access_token')

            # Get list of users that exist in Keycloak
            curl -k -X GET $KEYCLOAK_URL/admin/realms/master/users -H "Authorization: Bearer $access_token" | jq
            success=true
            break
        else
            echo "FAILED: HTTP response code is $response_code"
            ((attempt++))
            if (( attempt <= max_attempts )); then
                echo "Retrying in 10 seconds..."
                sleep 10
            else
                echo "Max attempts reached, exiting."
                exit 1
            fi
        fi
    done

    if ! $success; then
        echo "Failed to get users after $max_attempts attempts."
        return 1
    fi
}

TEST_container_starts_ok() {
    # Create Keystore and launch Keycloak
    create_keystore
    local -r container_id=$(start_container)
    trap "docker stop ${container_id} && rm -rf ${KEYSTORE_PATH}" EXIT

    # Check if the container is running
    sleep 15
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

TEST_keycloak_api_accessible() {
  local retries=10
  local delay=10
  local attempt=0

  while [[ $attempt -le $retries ]]; do
    local response_code=$(curl -kIso /dev/null -w "%{http_code}" "$KEYCLOAK_URL/realms/master")
    if [[ "$response_code" == "200" ]]; then
      echo "API endpoint is accessible and running."
      return 0
    else
      if [[ $attempt -lt $retries ]]; then
        echo "API is not responding. Status code: $response_code. Attempt $((attempt+1)) of $((retries+1))."
        echo "Retrying in $delay seconds..."
        sleep $delay
      else
        echo "FAILED: After $((retries+1)) attempts, API is still not responding."
        exit 1
      fi
    fi
    attempt=$((attempt+1))
  done
}


TEST_keycloak_api_get_users() {
    # Validate users can be retrieved from the Keycloak API.
    local users_json=$(keycloak_api_get_users)
    local extracted_username=$(echo "$users_json" | jq -r '.[] | select(.username=="admin") | .username')
    
    # There'll only be one user after fresh install / launch - 'admin'.
    if [[ "$exttracted_username" == "admin" ]]; then
        echo "Test passed: Found an entry with username 'admin'"
    else
        echo "FAILED: No entry with username 'admin' found in the response: ${users_json}"
        exit 1
    fi
}

TEST_container_starts_ok
TEST_keycloak_api_accessible
TEST_keycloak_api_get_users
