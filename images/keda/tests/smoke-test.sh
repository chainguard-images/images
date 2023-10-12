#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -x

# Run a real test using Keda's CRON trigger to scale a deployment

# Get the directory path of this script
SCRIPT_DIR=$(
	cd "$(dirname "$0")"
	pwd
)

# Deploy a test deployment
kubectl apply -f $SCRIPT_DIR/test-deployment.yaml -n default

sleep 5

# Wait for the replicaset to be ready and old pods to terminated
kubectl rollout status deployment/test-deployment --timeout=120s -n default

kubectl wait --for=condition=ready pod --selector app=test --timeout=120s -n default

# Use the keda autoscaler to scale the test deployment
kubectl apply -f $SCRIPT_DIR/scaledobject.yaml -n default
trap "kubectl delete -f $SCRIPT_DIR/scaledobject.yaml -n default" EXIT

sleep 5

# Wait for the replicaset to be ready and old pods to terminated
kubectl rollout status deployment/test-deployment --timeout=120s -n default

# Check the test pods are deployed and healthy
kubectl wait --for=condition=ready pod --selector app=test --timeout=120s -n default

# Define the deployment name and namespace (if any)
DEPLOYMENT_NAME=test-deployment
NAMESPACE=default

# Define the timeout and delay variables
TIMEOUT=180
DELAY=5
TIMER=0

EXPECTED_REPLICA=3

# Loop until the number of replicas equals 3 or until the timeout
while [ $TIMER -lt $TIMEOUT ]; do
	CURRENT_REPLICAS=$(kubectl get deployment ${DEPLOYMENT_NAME} -n ${NAMESPACE} -o jsonpath="{.status.readyReplicas}")
	if [ "$CURRENT_REPLICAS" -eq "$EXPECTED_REPLICA" ]; then
		echo "Deployment has been successfully scaled up to 3 replicas."
		exit 0
	else
		echo "Deployment has not been successfully scaled up. Current replicas: $CURRENT_REPLICAS"
	fi

	# Sleep for the specified delay, then increment the timer
	sleep $DELAY
	TIMER=$(($TIMER + $DELAY))
done

# If the loop completes without exiting, the script has timed out
echo "Script timed out before deployment could be scaled up to 3 replicas."
exit 1
