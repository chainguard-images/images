#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -x

# Start a Cassandra container
CASSANDRA_CONTAINER=$(docker run -d -e CASSANDRA_START_RPC=true $IMAGE_NAME)

# Wait for Cassandra to start
MAX_RETRIES=10
RETRY_INTERVAL=10

for ((i=0; i<MAX_RETRIES; i++)); do
  if docker exec "$CASSANDRA_CONTAINER" nodetool status; then
    echo "Cassandra is running"
    break
  else
    echo "Waiting for Cassandra to start..."
    sleep $RETRY_INTERVAL
  fi

  if [[ $i -eq $((MAX_RETRIES-1)) ]]; then
    echo "Error: Cassandra did not start within the expected time"
    docker logs "$CASSANDRA_CONTAINER"
    docker stop "$CASSANDRA_CONTAINER"
    docker rm "$CASSANDRA_CONTAINER"
    exit 1
  fi
done

# Create a keyspace and table, insert data, and query it
docker exec -i "$CASSANDRA_CONTAINER" cqlsh <<EOF
CREATE KEYSPACE testkeyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE testkeyspace;
CREATE TABLE users (user_id UUID PRIMARY KEY, name text);
INSERT INTO users (user_id, name) VALUES (uuid(), 'Chainguard');
SELECT * FROM users;
EOF
sleep 5

# Check if the data was inserted and queried correctly
RESULT=$(docker exec "$CASSANDRA_CONTAINER" cqlsh -e "USE testkeyspace; SELECT * FROM users;")
if [[ "$RESULT" != *"Chainguard"* ]]; then
  echo "Error: Data insertion/query failed"
  docker logs "$CASSANDRA_CONTAINER"
  docker stop "$CASSANDRA_CONTAINER"
  docker rm "$CASSANDRA_CONTAINER"
  exit 1
fi

# Clean up
docker stop "$CASSANDRA_CONTAINER"
docker rm "$CASSANDRA_CONTAINER"

echo "Cassandra functionality test passed!"