#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

# Function to retry a command until it succeeds or reaches max attempts
# Arguments:
#   $1: max_attempts
#   $2: interval (seconds)
#   $3: description of the operation
#   ${@:4}: command to execute
retry_command() {
    local max_attempts=$1
    local interval=$2
    local description=$3
    local cmd="${@:4}"
    local attempt=1

    echo "Retrying: $description"
    while [ $attempt -le $max_attempts ]; do
        echo "Attempt $attempt: $cmd"
        if eval $cmd; then
            echo "Success on attempt $attempt for: $description"
            return 0
        else
            echo "Failure on attempt $attempt for: $description"
            sleep $interval
        fi
        ((attempt++))
    done

    echo "Error: Failed after $max_attempts attempts for: $description"
    return 1
}

# Start a Cassandra container
CASSANDRA_CONTAINER=$(docker run -d -e CASSANDRA_START_RPC=true $IMAGE_NAME)

# Wait for Cassandra to start
retry_command 10 10 "Cassandra nodetool status" "docker exec \"$CASSANDRA_CONTAINER\" nodetool status"

# Check if CQL interface is ready
retry_command 10 10 "Cassandra CQL interface readiness" "docker exec \"$CASSANDRA_CONTAINER\" cqlsh -e \"DESCRIBE KEYSPACES\""

# Create a keyspace and table, insert data, and query it
retry_command 10 10 "Cassandra CQL commands" "docker exec -i \"$CASSANDRA_CONTAINER\" cqlsh -e \"
CREATE KEYSPACE testkeyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE testkeyspace;
CREATE TABLE users (user_id UUID PRIMARY KEY, name text);
INSERT INTO users (user_id, name) VALUES (uuid(), 'Chainguard');
SELECT * FROM users;
\""

# Check if the data was inserted and queried correctly
retry_command 10 10 "Cassandra data query" "
RESULT=\$(docker exec \"$CASSANDRA_CONTAINER\" cqlsh -e \"USE testkeyspace; SELECT * FROM users;\")
if [[ \"\$RESULT\" == *\"Chainguard\"* ]]; then
    echo \"Data insertion/query successful\"
else
    echo \"Data insertion/query failed\"
    exit 1
fi
"

echo "Cassandra functionality test passed!"
