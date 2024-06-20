#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -x


kubectl apply -f $SCRIPT_DIR/test-deployment.yaml -n default

sleep 5

kubectl rollout status deployment/test-deployment --timeout=120s -n default

kubectl wait --for=condition=ready pod --selector app=test --timeout=120s -n default

kubectl apply -f $SCRIPT_DIR/scaledobject.yaml -n default
trap "kubectl delete -f $SCRIPT_DIR/scaledobject.yaml -n default" EXIT

sleep 5

kubectl rollout status deployment/test-deployment --timeout=120s -n default

kubectl wait --for=condition=ready pod --selector app=test --timeout=120s -n default

DEPLOYMENT_NAME=test-deployment
NAMESPACE=default

TIMEOUT=180
DELAY=5
TIMER=0

EXPECTED_REPLICA=3

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

echo "Script timed out before deployment could be scaled up to 3 replicas."
exit 1
