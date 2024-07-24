#!/usr/bin/env bash

# Tests Keycloak in production mode. This requires a keystore to be created
# and mounted into the Keycloak container image.

# NOTE: '--http1.1' is used by the curl commands in this test, to work-around
# an issue only reproducible in CI. This may not be requied in future:
# `curl: (92) HTTP/2 stream 0 was not closed cleanly: PROTOCOL_ERROR.``

set -o errexit -o nounset -o errtrace -o pipefail -x

KEYCLOAK_HOSTNAME="localhost"
KEYCLOAK_PORT=${FREE_PORT}
KEYCLOAK_URL="https://${KEYCLOAK_HOSTNAME}:${KEYCLOAK_PORT}"
KEYSTORE_PASSWORD="AbCdEfG0!12345678NotReal"

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TMPFOLDER="$(mktemp -d)"

CONTAINER_NAME="keycloak-$(uuidgen)"

REQUEST_RETRIES=10
RETRY_DELAY=15

expected_logs=(
  "Listening on: https://0.0.0.0:8443"
  "Profile prod activated"
)
missing_logs=()

TEST_create_keystore() {
  keytool -v -keystore "${TMPFOLDER}/server.keystore" \
    -alias "$KEYCLOAK_HOSTNAME" \
    -genkeypair -sigalg SHA512withRSA -keyalg RSA \
    -dname "CN=$KEYCLOAK_HOSTNAME" \
    -storepass "$KEYSTORE_PASSWORD"
}

TEST_start_container() {
  container_id=$(docker run \
    -v "${TMPFOLDER}/server.keystore:/opt/keycloak/conf/server.keystore" \
    --detach --rm \
    --name "${CONTAINER_NAME}" -p "${KEYCLOAK_PORT}:8443" \
    -e KEYCLOAK_ADMIN=admin \
    -e KEYCLOAK_ADMIN_PASSWORD="${KEYSTORE_PASSWORD}" \
    "${IMAGE_NAME}" \
    start --optimized \
    --hostname="${KEYCLOAK_URL}" \
    --https-key-store-file="/opt/keycloak/conf/server.keystore" \
    --https-key-store-password="${KEYSTORE_PASSWORD}")

    trap "docker stop ${container_id} && rm -rf ${TMPFOLDER}" EXIT
    sleep 15

    if ! docker ps --filter "name=${CONTAINER_NAME}" --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
      echo "FAILED: ${CONTAINER_NAME} is not running."
      exit 1
    fi
}

TEST_validate_container_logs() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    local logs=$(docker logs "${container_id}" 2>&1)
    local logs_found=true

    # Search the container logs for our expected log lines.
    for log in "${expected_logs[@]}"; do
      if ! echo "$logs" | grep -Fq "$log"; then
        logs_found=false
      fi
    done

    if $logs_found; then
      return 0
    elif [[ $i -lt ${REQUEST_RETRIES} ]]; then
      echo "Some expected logs were missing. Retrying in ${RETRY_DELAY} seconds..."
      sleep ${RETRY_DELAY}
    fi
  done

  # After all retries, record the missing logs
  for log in "${expected_logs[@]}"; do
    if ! echo "${logs}" | grep -Fq "$log"; then
      missing_logs+=("${log}")
    fi
  done

  echo "FAILED: The following log lines were not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

TEST_keycloak_api() {
  local attempt=0
  local success=false

  while (( attempt < ${REQUEST_RETRIES} )); do
    # Get an API token for Keycloak.
    local response=$(
      curl --http1.1 -k -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
        -X POST \
        "${KEYCLOAK_URL}/realms/master/protocol/openid-connect/token" \
        -d "client_id=admin-cli" \
        -H "content-type: application/x-www-form-urlencoded" \
        -d "username=admin" \
        -d "password=${KEYSTORE_PASSWORD}" \
        -d "grant_type=password"
    )

    local response_code=$(echo "${response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
    local content=$(echo "${response}" | sed '/HTTP_STATUS_CODE/d')

    if [[ "${response_code}" == "200" ]]; then
      local access_token=$(echo "${content}" | jq --raw-output '.access_token')

      # Invoke Keycloak's API to retrieve a list of users.
      local users_output=$(curl --http1.1 -kv -X GET "${KEYCLOAK_URL}/admin/realms/master/users" \
        -H "Authorization: Bearer ${access_token}")
      success=true
      break
    else
      sleep ${RETRY_DELAY}
    fi
    attempt=$((attempt+1))
  done

  if ! $success; then
    echo "ERROR: Failed to get user data from the API after ${REQUEST_RETRIES} attempts." >&2
    return 1
  fi

  extracted_username=$(echo "${users_output}" | jq -r '.[] | select(.username=="admin") | .username')
  if [[ "${extracted_username}" == "admin" ]]; then
    echo "Keycloak API correctly returned 'admin' user details."
  else
    echo "FAILED: No entry with username 'admin' found in the response: ${users_output}"
    exit 1
  fi
}

TEST_create_keystore
TEST_start_container
TEST_validate_container_logs
TEST_keycloak_api
