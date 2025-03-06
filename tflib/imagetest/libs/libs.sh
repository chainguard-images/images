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
	local max_retries=$1
	local delay=$2
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

image_ref() {
	
}