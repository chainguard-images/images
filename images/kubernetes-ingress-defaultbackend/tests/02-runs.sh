#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

URL="http://127.0.0.1:${FREE_PORT}"

docker run --rm -d -p "$FREE_PORT:8080" $IMAGE_NAME

# Maximum number of attempts to check the health check endpoint
MAX_ATTEMPTS=30

# Delay (in seconds) between attempts
DELAY=5

attempt=0
until $(curl --output /dev/null --silent --head --fail "$URL/healthz"); do
	if [ $attempt -eq $MAX_ATTEMPTS ]; then
		echo "Max attempts reached, exiting..."
		exit 1
	fi

	printf '.'
	attempt=$(($attempt + 1))

	# Delay before next attempt
	sleep $DELAY
done

echo "Health check endpoint is available!"
