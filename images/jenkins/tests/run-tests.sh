#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME="jenkins-$(uuidgen)"
JENKINS_PORT=${FREE_PORT}

REQUEST_RETRIES=10
RETRY_DELAY=15

expected_logs=(
  "Started all plugins"
  "Loaded all jobs"
  "Jenkins is fully up and running"
)
missing_logs=()

# Start Jenkins container and set a trap to ensure it's stopped on exit.
start_container() {  
  container_id=$(docker run \
    --detach --rm \
    --name "${CONTAINER_NAME}" -p $JENKINS_PORT:8080 \
    --env JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
    "${IMAGE_NAME}")

  trap "docker stop ${container_id}" EXIT
  sleep 10
}

# Validate that Jenkins container logs contain expected log messages.
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

  echo "FAILED: The following log lines where not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

# Check that Jenkins responds 200 HTTP status code indicating it's operational.
TEST_http_response() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    if [ $(curl -o /dev/null -s -w "%{http_code}" "http://localhost:${JENKINS_PORT}") -eq 200 ]; then
      return 0 
    fi
    sleep ${RETRY_DELAY}
  done

  echo "FAILED: Did not receive 200 HTTP response from Jenkins after ${REQUEST_RETRIES} attempts."
  exit 1
}


# Check Jenkins web page for expected content.
TEST_jenkins_web_content() {
  for ((i=1; i<=${REQUEST_RETRIES}; i++)); do
    if curl -s "http://localhost:${JENKINS_PORT}" | grep -q "Welcome to Jenkins!"; then
      return 0 
    fi
    sleep ${RETRY_DELAY}
  done

  echo "FAILED: 'Welcome to Jenkins!' not found in web page content after ${REQUEST_RETRIES} attempts."
  exit 1
}

start_container
TEST_validate_container_logs
TEST_http_response
TEST_jenkins_web_content
