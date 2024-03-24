#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Docker details
container_name="blackbox-exporter-$(uuidgen)"
container_port=${FREE_PORT}
port_mapping="$container_port:9115"
config_file="./blackbox.yml" # Path to your Blackbox configuration file


# Function to stop and remove the container
cleanup() {
    echo "Stopping and removing the Blackbox Exporter container..."
    docker rm -f ${container_name}
}

# Register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# Start the Blackbox Exporter container
echo "Starting Blackbox Exporter container..."
docker run -d --name ${container_name} --rm -p ${port_mapping} $IMAGE_NAME

# Define the Blackbox Exporter address
blackbox_exporter_address="http://localhost:${container_port}"

# Wait for the Blackbox Exporter to become responsive
max_attempts=5  # Number of curl attempts before timing out
delay_between_attempts=2  # Delay between attempts in seconds

echo "Waiting for Blackbox Exporter to become available..."

attempt_counter=0
while ! curl --output /dev/null --silent --head --fail "${blackbox_exporter_address}"; do
    if ((attempt_counter >= max_attempts)); then
        echo "Blackbox Exporter is not up after $((max_attempts * delay_between_attempts)) seconds."
        exit 1
    fi
    printf '.'
    attempt_counter=$((attempt_counter+1))
    sleep $delay_between_attempts
done

echo "Blackbox Exporter is up and running."

# Define the module and target for the test
module="http_2xx"
target="http://example.com"

# Perform the test using curl and check the response
response=$(curl -s "${blackbox_exporter_address}/probe?module=${module}&target=${target}" | grep "^probe_success" | cut -d ' ' -f2)

# Check if the probe was successful
if [ "$response" == "1" ]; then
  echo "Probe successful!"
else
  echo "Probe failed!"
fi

# Additionally, print out the entire metrics result for detailed inspection
echo "Full metrics output from the Blackbox Exporter:"
curl -s "${blackbox_exporter_address}/probe?module=${module}&target=${target}"
