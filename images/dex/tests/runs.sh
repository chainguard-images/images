#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

PORT=5556

URL="http://127.0.0.1:${FREE_PORT}"
docker run --rm -d -p ${FREE_PORT}:$PORT "${IMAGE_NAME}" dex serve /etc/dex/config.docker.yaml

MAX_ATTEMPTS=20 # Maximum number of attempts to check the health check endpoint
DELAY=3         # Delay (in seconds) between attempts

attempt=0
until $(curl --output /dev/null --silent --head --fail "$URL/dex/healthz"); do
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

curl -L "$URL/dex/.well-known/openid-configuration" | jq '.issuer' | grep ":$PORT/dex"
