#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Variables
HOST="localhost"
USER="root"
PASSWORD="root_password"
DATABASE="test_db"
CONTAINER_NAME="percona_container"
PORT=3306

# Function to pull and run Percona Docker container
run_percona_container() {
    echo "Running Percona container..."
    docker run -d --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$PASSWORD $IMAGE_NAME
}

# Function to connect to Percona server
test_connection() {
    # Wait for the container to be fully up and running
    docker run --network container:"${CONTAINER_NAME}" cgr.dev/chainguard/wait-for-it localhost:${PORT} --timeout=60 --strict 
    echo "Percona container is up and running."
}

# Function to create a test database
create_test_database() {
    echo "Creating test database $DATABASE..."
    docker exec $CONTAINER_NAME mysql -h "$HOST" -u "$USER" -p"$PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"
    if [ $? -eq 0 ]; then
        echo "Database $DATABASE created successfully."
    else
        echo "Failed to create database $DATABASE. Exiting..."
        exit 1
    fi
}

# Function to create a test table and insert records
create_table_and_insert_records() {
    echo "Creating test table and inserting records..."
    docker exec $CONTAINER_NAME mysql -h "$HOST" -u "$USER" -p"$PASSWORD" -D "$DATABASE" -e "
    CREATE TABLE IF NOT EXISTS test_table (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        age INT NOT NULL
    );
    INSERT INTO test_table (name, age) VALUES
    ('Alice', 30),
    ('Bob', 25),
    ('Charlie', 35);
    "
    if [ $? -eq 0 ]; then
        echo "Table created and records inserted successfully."
    else
        echo "Failed to create table or insert records. Exiting..."
        exit 1
    fi
}

# Function to run a query to retrieve records
retrieve_records() {
    echo "Retrieving records from the test table..."
    QUERY_RESULT=$(docker exec $CONTAINER_NAME mysql -h "$HOST" -u "$USER" -p"$PASSWORD" -D "$DATABASE" -e "SELECT * FROM test_table;" 2>&1)
    if [ $? -eq 0 ]; then
        echo "Query successful. Records in test_table:"
        echo "$QUERY_RESULT"
    else
        echo "Query failed. Error: $QUERY_RESULT"
        exit 1
    fi
}

# Trap function to ensure cleanup on script exit
cleanup() {
    docker container logs $CONTAINER_NAME
}

# Set up trap to call cleanup function on script exit
trap cleanup EXIT


# Run Percona container
run_percona_container
test_connection

# Run tests
create_test_database
create_table_and_insert_records
retrieve_records

echo "All tests completed successfully."
