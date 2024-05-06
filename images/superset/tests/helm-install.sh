#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail -x
# Variables
RELEASE_NAME="superset"
NAMESPACE="superset"
PORT=8088
apk add curl
# Wait for all pods to be up and running
echo "Waiting for all pods to be up and running..."
kubectl wait --for=condition=ready pod -l "app=superset-worker" -n $NAMESPACE --timeout=180s

worker=$(kubectl get pod -l "app=superset-worker" -n $NAMESPACE -o jsonpath="{.items[0].metadata.name}")


# Create an admin user
echo "Creating admin user..."
kubectl exec -it $worker -n $NAMESPACE -- superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin

# Perform database migration
echo "Upgrading database..."
kubectl exec -it $worker -n $NAMESPACE -- superset db upgrade

# Load examples
echo "Loading examples..."
kubectl exec -it $worker -n $NAMESPACE -- superset load_examples

# Initialize Superset (this sets up roles and permissions)
echo "Initializing Superset..."
kubectl exec -it $worker -n $NAMESPACE -- superset init

# Port-forward to access Superset locally
echo "Port-forwarding to access Superset locally on port $PORT..."
kubectl port-forward svc/$RELEASE_NAME 8088:$PORT -n $NAMESPACE &
sleep 10 # Wait a bit for port-forwarding to establish

# Check if Superset is up and running by hitting the login page
echo "Checking if Superset is up and running by accessing the login page..."
HTTP_RESPONSE=$(curl --write-out "%{http_code}" --silent --output /dev/null "http://localhost:$PORT/login/")

if [ "$HTTP_RESPONSE" -eq 200 ]; then
    echo "Test Successful: Superset is up and running, and the login page is accessible."
else
    echo "Test Failed: Superset login page is not accessible. HTTP status code: $HTTP_RESPONSE"
fi

# Clean up port-forwarding
kill %1

# Exit script
exit 0
