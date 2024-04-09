#!/usr/bin/env bash

# TODO: Convert this to run with imagetest_harness_container when available

set -o errexit -o nounset -o errtrace -o pipefail -x

container_name="filebeat-${RANDOM}"

docker run -d \
  --name=${container_name} \
  --user=nonroot \
  --volume="$(pwd)/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="nonroot:/usr/share/filebeat/data:rw" \
  ${IMAGE_NAME} filebeat -e --strict.perms=false

trap "docker rm -f ${container_name}" EXIT
# Write a log message and expect the log to be ingested
docker exec "${container_name}" sh -c 'echo "test chainguard" > /tmp/test.log'
sleep 60
docker exec "${container_name}" sh -c 'ls -al /tmp'
docker cp "${container_name}:/tmp" "${PWD}/localcopy"
sleep 60

# Get the .ndjson file dynamically from ls output
ndjson_file=$(find ${PWD}/localcopy/tmp -name "foobar*.ndjson" -print -quit)


# Check if any .ndjson file is found
if [ -n "$ndjson_file" ]; then
    # Use jq to filter messages containing "test"
    jq '. | select(.message | contains("test"))' "$ndjson_file"
else
    echo "Error: No .ndjson file found"
fi
