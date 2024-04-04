#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"squid-proxy-${FREE_PORT}"}

start_container() {
    docker run -d --rm --name "$CONTAINER_NAME" "$IMAGE_NAME"
    echo "Container $CONTAINER_NAME started."
}

# Setup trap for cleanup and logs retrieval
cleanup() {
    echo "Retrieving logs from $CONTAINER_NAME..."
    docker logs "$CONTAINER_NAME"
    echo "Removing container $CONTAINER_NAME..."
    docker rm -f "$CONTAINER_NAME"
}

trap cleanup EXIT

# Start the Squid container
start_container

# Squid proxy details
PROXY_HOST="localhost"
PROXY_PORT="3128"
URL="http://example.com"

# Function to continuously check Squid proxy readiness
monitor_proxy() {
    while true; do
        OUTPUT=$(docker exec "$CONTAINER_NAME" curl -x http://"$PROXY_HOST":"$PROXY_PORT" "$URL" -o /dev/null -w '%{http_code}' -s)
        if [ "$OUTPUT" -eq 200 ]; then
            echo "$(date): Squid proxy is operational."
        else
            echo "$(date): Squid proxy check failed with HTTP Status: $OUTPUT"
        fi
        sleep 30
    done
}

# Start monitoring in the background
monitor_proxy &

# Keep the script running to maintain the container
wait
