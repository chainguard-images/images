#!/usr/bin/env bash

# Function to perform linear backoff retry
# Usage: retry_until max_retries delay command [args...]
#
# Arguments:
#   max_retries - Maximum number of retries
#   delay       - Delay in seconds between retries
#   command     - The command to run and retry if it fails
#   args        - Arguments for the command
#
# Example:
#   retry_until 5 2 curl -s --fail http://example.com/nonexistent
retry_until() {
  local max_retries=${1:-6}
  local delay=${2:-20}
  local current_retry=0
  local exit_code=0

  shift 2

  while ((current_retry < max_retries)); do
    if "$@"; then
      return 0
    else
      exit_code=$?
    fi

    current_retry=$((current_retry + 1))
    echo "Attempt $current_retry failed with exit code $exit_code. Retrying in $delay seconds..."
    sleep "$delay"
  done

  echo "Failed after $max_retries attempts."
  return $exit_code
}

apk_add() {
  local max_retries=6
  local delay=20
  local packages=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --retries=*)
        max_retries="${1#*=}"
        shift
        ;;
      --delay=*)
        delay="${1#*=}"
        shift
        ;;
      *)
        # Everything else is a package
        packages+=("$1")
        shift
        ;;
    esac
  done

  retry_until $max_retries $delay apk add "${packages[@]}"
}

get_test_image() {
  local name="${1:?Image name required}"
  local type="${2:-ref}"
  local image
  image="$(echo "$IMAGES" | jq --raw-output --exit-status ".[\"$name\"].${type}")"
  if [ "$image" = "" ] || [ "$image" = "null" ]; then
    echo >&2 "Image '$name' not provided"
    return 1
  fi
  echo "$image"
}

# Function to wait until a flag file is present as a
# simple mechanism for debugging test scripts
#
# When this function is called, create a file /tmp/CONTINUE
# externally (i.e. via docker exec) to unpause the test.
#
# The flag file is removed after each invocation, so multiple
# calls to this function can be used to debug tests.
#
# Usage: test_debug_pause [timeout]
#
# Arguments:
#   timeout     - Maximum time to wait in seconds (defaults to 1200)
#
# Example:
#   test_debug_pause
test_debug_pause() {
  local timeout="${1:-1200}"
  echo >&2 "PAUSING TEST FOR DEBUGGING"
  retry_until "${timeout}" 1 test -f /tmp/CONTINUE
  rm -f /tmp/CONTINUE
  echo >&2 "CONTINUING TESTS"
}

# Function to print info lines with dash separators
# Usage: line_info [message]
#
# Arguments:
#   message     - Optional message to wrap with dashes
#
# Examples:
#   line_info                    # Prints: ----
#   line_info "Starting tests"   # Prints: ---- Starting tests ----
line_info() {
  local message="$1"
  if [ -z "$message" ]; then
    echo "----"
  else
    echo "---- $message ----"
  fi
}
