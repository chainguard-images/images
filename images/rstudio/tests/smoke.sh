#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="rstudio-$(uuidgen)"

RSTUDIO_PORT="${FREE_PORT}"

REQUEST_RETRIES=10
RETRY_DELAY=15

declare -a expected_logs=(
  "Adding user to cache"
  "Running as server user"
  "Initialized file locks"
  "Connecting to sqlite3 database"
  "Creating database connection pool"
  "Creating secure key file"
  "Using secure key file"
)
declare -a missing_logs=()

# Validate RStudio installation
# Must be ran before server starts
docker run \
  --rm \
  -p "${RSTUDIO_PORT}":"${RSTUDIO_PORT}" \
  -e "RS_LOG_LEVEL=debug" \
  -e "RS_LOGGER_TYPE=stderr" \
  --name "${CONTAINER_NAME}" \
  --entrypoint rstudio-server \
  "${IMAGE_NAME}" \
  verify-installation

# Run RStudio server
docker run \
  -d --rm \
  -p "${RSTUDIO_PORT}":"${RSTUDIO_PORT}" \
  -e "RS_LOG_LEVEL=debug" \
  -e "RS_LOGGER_TYPE=stderr" \
  --name "${CONTAINER_NAME}" \
  "${IMAGE_NAME}" \
  --www-port "${RSTUDIO_PORT}"

# Stop container when script exits
trap "docker stop ${CONTAINER_NAME}" EXIT

# Validate that RStudio container logs contain expected log messages.
TEST_validate_container_logs() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    local logs=$(docker logs "${CONTAINER_NAME}" 2>&1)
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

# Check that RStudio responds 200 HTTP status code indicating it's operational.
TEST_http_response() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    if [ $(curl -o /dev/null -s -w "%{http_code}" "http://localhost:${RSTUDIO_PORT}/unsupported_browser.htm") -eq 200 ]; then
      return 0 
    fi
    sleep ${RETRY_DELAY}
  done

  echo "FAILED: Did not receive 200 HTTP response from RStudio after ${REQUEST_RETRIES} attempts."
  exit 1
}

TEST_install_package() {
  # Install R package
  docker exec "${CONTAINER_NAME}" \
    Rscript -e 'install.packages("ggplot2", repos = "https://cloud.r-project.org")'

  # Import library
  docker exec "${CONTAINER_NAME}" \
    Rscript -e 'library("ggplot2")'
}

TEST_validate_container_logs
TEST_http_response
TEST_install_package
