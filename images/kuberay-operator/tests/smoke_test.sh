#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

sleep 5

DELAY=5
NAMESPACE="kuberay-operator"
TIMER=0
TIMEOUT=60

# Loop until the current time is greater than the end time
while [ $TIMER -lt $TIMEOUT ]; do
  # Run the command and check for the pod is running
  STATUS=$(kubectl get pods -n "$NAMESPACE" -o jsonpath='{.items[*].status.phase}')
  if echo "$STATUS" | grep -q "Running"; then
    echo "All good, its running"
      exit 0
  fi

	# Sleep for the specified delay, then increment the timer
	sleep $DELAY
	TIMER=$(($TIMER + $DELAY))
done

echo "Failed to start within 3 minutes"
exit 1