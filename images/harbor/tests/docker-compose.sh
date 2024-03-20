#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Used to retrieve the version of Harbor in Wolfi
WOLFI_CONTAINER_NAME="wolfi-$(uuidgen)"

LOG_PORT="${FREE_PORT}"
LOG_PORT_PLUS="$((${LOG_PORT} + 1))"
PORTAL_PORT="$((${LOG_PORT_PLUS} + 1))"
PORTAL_PORT_PLUS="$((${PORTAL_PORT} + 1))"

REQUEST_RETRIES=15
RETRY_DELAY=20

declare -a expected_logs=(
  "Server initialized"
  "Ready to accept connections"
  "Internal tls trust CA appending is Done"
  "the factory for adapter harbor registered"
  "get configuration from url"
  "Process for migrating data is started"
  "Register job"
  "API server is serving at"
)
declare -a missing_logs=()

# Start and update Wolfi
docker run \
  -d --rm \
  --name "${WOLFI_CONTAINER_NAME}" \
  --entrypoint sleep \
  cgr.dev/chainguard/wolfi-base \
  infinity
docker exec "${WOLFI_CONTAINER_NAME}" apk update

# Retrieve Harbor version
WOLFI_HARBOR_VERSION=$(docker exec "${WOLFI_CONTAINER_NAME}" apk search harbor-core | sed 's/harbor-core-//' | sed 's/-r.*//')

# Stop Wolfi
docker stop "${WOLFI_CONTAINER_NAME}"

# Retrieve Harbor online installer
wget https://github.com/goharbor/harbor/releases/download/v"${WOLFI_HARBOR_VERSION}"/harbor-online-installer-v"${WOLFI_HARBOR_VERSION}".tgz
tar xvfz ./harbor-online-installer*.tgz
cd harbor

# Configure Harbor
mv harbor.yml.tmpl harbor.yml
yq -i '.hostname = "localhost"' harbor.yml
yq -i 'del(."https")' harbor.yml

# Generate docker-compose
./prepare

# Fix permissions
sudo chmod -R 777 ./*

# Remove deprecated version entry
yq -i 'del(."version")' docker-compose.yml

# Substitute for our images
yq -i '.services.core.image = "'"${CORE_IMAGE}:${CORE_TAG}"'"' docker-compose.yml
yq -i '.services.jobservice.image = "'"${JOBSERVICE_IMAGE}:${JOBSERVICE_TAG}"'"' docker-compose.yml
yq -i '.services.portal.image = "'"${PORTAL_IMAGE}:${PORTAL_TAG}"'"' docker-compose.yml
yq -i '.services.registry.image = "'"${REGISTRY_IMAGE}:${REGISTRY_TAG}"'"' docker-compose.yml
yq -i '.services.registryctl.image = "'"${REGISTRYCTL_IMAGE}:${REGISTRYCTL_TAG}"'"' docker-compose.yml

# Start containers
docker-compose up -d
trap "docker-compose down" EXIT

# Validate that container logs contain expected messages.
TEST_validate_container_logs() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    local logs=$(docker compose logs 2>&1)
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

  echo "FAILED: The following log lines where not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

# Check that portal responds 200 HTTP status code indicating it's operational.
TEST_http_response() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    if [ $(curl -o /dev/null -s -w "%{http_code}" "http://localhost:80") -eq 200 ]; then
      return 0 
    fi
    sleep ${RETRY_DELAY}
  done

  echo "FAILED: Did not receive 200 HTTP response from portal after ${REQUEST_RETRIES} attempts."
  exit 1
}

# Push Wolfi to registry!
TEST_push_to_registry() {
  # Login with default username and password
  docker login localhost --username admin --password Harbor12345

  # Pull Wolfi - should be available from retrieving Harbor version earlier
  docker pull cgr.dev/chainguard/wolfi-base:latest

  # Tag image for local registry
  docker tag cgr.dev/chainguard/wolfi-base:latest localhost/library/wolfi-base:latest

  # Push Wolfi to local registry
  docker push localhost/library/wolfi-base:latest
}

TEST_validate_container_logs
TEST_http_response
TEST_push_to_registry
