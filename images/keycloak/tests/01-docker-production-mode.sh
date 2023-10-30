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
  local logs=$(docker logs "${container_id}" 2>&1)

  echo "Docker logs are: \n ${logs}"

  for term in "${terms[@]}"; do
    if echo "$logs" | grep -Fq "$term"; then
      echo "Found log term: $term"
    else
      echo "Log term NOT found: $term"
      missing_terms+=("$term")
    fi
  done
}

keycloak_api_get_users() {
    # Get Keycloak access token
    local response=$(curl -k -s -w "\nHTTP_STATUS_CODE:%{http_code}\n" -X POST $KEYCLOAK_URL/realms/master/protocol/openid-connect/token \
        --user admin-cli:Psip5UvTO1EXUEwzb15nxLWnwdU1Nlcg \
        -H 'content-type: application/x-www-form-urlencoded' \
        -d "username=admin&password=$KEYSTORE_PASSWORD&grant_type=password")

    local response_code=$(echo "$response" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
    local content=$(echo "$response" | sed '/HTTP_STATUS_CODE/d')

    if [[ "$response_code" != "200" ]]; then
        echo "FAILED: HTTP response code is $response_code"
        exit 1
    fi

    local access_token=$(echo "$content" | jq --raw-output '.access_token')

    # Get list of users that exist in Keycloak
    curl -k -X GET $KEYCLOAK_URL/admin/realms/master/users -H "Authorization: Bearer $access_token" | jq
}


TEST_container_starts_ok() {
    # Create Keystore and launch Keycloak
    create_keystore
    local -r container_id=$(start_container)
    trap "docker stop ${container_id} && rm -rf ${KEYSTORE_PATH}" EXIT

    # Check if the container is running
    sleep 20
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
  local response_code=$(curl -k -I -s -o /dev/null -w "%{http_code}" "$KEYCLOAK_URL/realms/master")

  if [[ "$response_code" == "200" ]]; then
    echo "API endpoint is accessible and running."
  else
    echo "FAILED: API is not responding. Status code: $response_code"
    exit 1
  fi
}

TEST_keycloak_api_get_users() {
    # Validate users can be retrieved from the Keycloak API.
    local users_json=$(keycloak_api_get_users)
    local exttracted_username=$(echo "$users_json" | jq -r '.[] | select(.username=="admin") | .username')
    
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
