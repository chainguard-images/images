#!/bin/bash

# Variables
CONTAINER_NAME="superset"
export SUPERSET_SECRET_KEY="$(openssl rand -base64 42)"
PORT=8080

echo "Starting Apache Superset container..."
docker run -d -p $PORT:8088 -e "SUPERSET_SECRET_KEY=$UPERSET_SECRET_KEY" --name $CONTAINER_NAME $IMAGE_NAME

# Wait for container to start properly
echo "Waiting for container to start..."
sleep 60  # Adjust this based on how long your container typically takes to become responsive

# Create an admin user
echo "Creating admin user..."
docker exec -it $CONTAINER_NAME superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin

# Perform database migration
echo "Upgrading database..."
docker exec -it $CONTAINER_NAME superset db upgrade

# Load examples
echo "Loading examples..."
docker exec -it $CONTAINER_NAME superset load_examples

# Initialize Superset (this sets up roles and permissions)
echo "Initializing Superset..."
docker exec -it $CONTAINER_NAME superset init

# Check if Superset is up and running by hitting the login page
echo "Checking if Superset is up and running by accessing the login page..."
HTTP_RESPONSE=$(curl --write-out "%{http_code}" --silent --output /dev/null "http://localhost:$PORT/login/")

if [ "$HTTP_RESPONSE" -eq 200 ]; then
    echo "Test Successful: Superset is up and running, and the login page is accessible."
else
    echo "Test Failed: Superset login page is not accessible. HTTP status code: $HTTP_RESPONSE"
fi

# Optionally, you can clean up by stopping and removing the container
# echo "Cleaning up: Stopping and removing container..."
# docker stop $CONTAINER_NAME
# docker rm $CONTAINER_NAME

# Exit script
exit 0
