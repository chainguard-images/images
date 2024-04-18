#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Step 0: Pull and run a StatsD Docker container
echo "Starting StatsD Docker container..."
cid=$(docker run -d -e NR_API_KEY=${NR_API_KEY} ${IMAGE_NAME})

while ! docker logs $cid 2>&1 | grep "Initialised backend"; do
	echo "Waiting for StatsD Docker container to be ready..."
	sleep 1
done

echo "StatsD Docker container is ready."
