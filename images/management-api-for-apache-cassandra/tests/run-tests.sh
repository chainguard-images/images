#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

# Looks for these log statements in the pod logs
expected_logs=(
  "Found Cassandra binary"
  "Started Server"
  "Started Cassandra"
)

missing_logs=()

# Function to retry a command until it succeeds or reaches max attempts
# Arguments:
#   $1: max_attempts
#   $2: interval (seconds)
#   $3: description of the operation
#   ${@:4}: command to execute
retry_command() {
    local max_attempts=$1
    local interval=$2
    local description=$3
    local cmd="${@:4}"
    local attempt=1

    echo "Retrying: $description"
    while [ $attempt -le $max_attempts ]; do
        echo "Attempt $attempt: $cmd"
        if eval $cmd; then
            echo "Success on attempt $attempt for: $description"
            return 0
        else
            echo "Failure on attempt $attempt for: $description"
            sleep $interval
        fi
        ((attempt++))
    done

    echo "Error: Failed after $max_attempts attempts for: $description"
    return 1
}

# Validates expected log messages are present
TEST_validate_container_logs() {
  apk add grep

  local logs=$(docker logs "${CASSANDRA_CONTAINER}" 2>&1)
  local logs_found=true

  # Search the container logs for our expected log lines.
  for log in "${expected_logs[@]}"; do
    if echo "$logs" | /usr/bin/grep -qvz "$log"; then
      logs_found=false
    fi
  done

  if $logs_found; then
    return 0
  fi

  # After all retries, record the missing logs
  for log in "${expected_logs[@]}"; do
    if ! echo "${logs}" | /usr/bin/grep -Fq "$log"; then
      missing_logs+=("${log}")
    fi
  done

  echo "FAILED: The following log lines were not found:"
  printf '%s\n' "${missing_logs[@]}"
  exit 1
}

# Start a Cassandra container
CASSANDRA_CONTAINER=$(docker run -d -e CASSANDRA_START_RPC=true $IMAGE_NAME)

# Intentional long sleep, it really does take this long! We have a retry block
# below, but each retry before it's up causes an exception in the logs, so this
# will minimize that.
sleep 75

# Wait for Cassandra to start
retry_command 10 10 "Cassandra nodetool status" "docker exec \"$CASSANDRA_CONTAINER\" nodetool status"

TEST_validate_container_logs