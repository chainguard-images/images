#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

container_name="newrelic-nri-statsd-${RANDOM}"

# Step 0: Pull and run a StatsD Docker container
echo "Starting StatsD Docker container..."
docker run -d -e NR_API_KEY=${NR_API_KEY} -e NR_STATSD_METRICS_ADDR=":${FREE_PORT}" --name $container_name -p ${FREE_PORT}:${FREE_PORT} ${IMAGE_NAME}

# wait for the container to be ready by checking the connection to 8125
while ! nc -z localhost ${FREE_PORT}; do
  echo "Waiting for StatsD Docker container to be ready..."
  sleep 1
done

echo "StatsD Docker container is ready."
