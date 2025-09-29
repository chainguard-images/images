#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Extract image reference
image=$(echo "$IMAGES" | jq -r '.valkey.ref')

echo "=== Basic version test ==="
docker run --rm "$image" --version

echo "=== Server functionality test ==="
# Use random ID for container naming to avoid conflicts
ID="$(date +%s)-${RANDOM}"
CONTAINER_NAME="valkey-smoketest-${ID}"

# Run valkey server container
docker run -d --name $CONTAINER_NAME "$image"

cleanup() {
    docker logs $CONTAINER_NAME || true
    docker rm -f $CONTAINER_NAME || true
}
trap cleanup EXIT

# Wait for valkey to be ready
for i in {1..30}; do
    if docker exec $CONTAINER_NAME valkey-cli ping 2>/dev/null | grep -q PONG; then
        echo "Valkey is ready!"
        break
    fi
    echo "Waiting for valkey to be ready... ($i/30)"
    sleep 2
done

echo "=== Testing valkey-cli operations ==="
# Test basic valkey operations using valkey-cli
docker exec $CONTAINER_NAME valkey-cli SET key1 "test-value"

# Get the value and verify
result=$(docker exec $CONTAINER_NAME valkey-cli GET key1)
if [[ "$result" == "test-value" ]]; then
    echo "SET/GET test passed"
else
    echo "SET/GET test failed: expected 'test-value', got '$result'"
    exit 1
fi

# Test increment
docker exec $CONTAINER_NAME valkey-cli SET counter 1
docker exec $CONTAINER_NAME valkey-cli INCR counter
counter_result=$(docker exec $CONTAINER_NAME valkey-cli GET counter)

if [[ "$counter_result" == "2" ]]; then
    echo "INCR test passed"
else
    echo "INCR test failed: expected '2', got '$counter_result'"
    exit 1
fi

echo "=== All valkey tests completed successfully ==="