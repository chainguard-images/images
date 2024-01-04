#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -x

sleep 5

# There are docs to test a deployment of the operator, but this is not
# working, same result with the upstream image. # https://github.com/vmware/kube-fluentd-operator#try-it-out

# Instead, we will test the operator by deploying the log-router helm chart
# + check the logs contain the expected text

# Define the timeout and delay variables
TIMEOUT=180
DELAY=5
TIMER=0

# Loop until the current time is greater than the end time
while [ $TIMER -lt $TIMEOUT ]; do
  # Run the command and check for the pod is running
  if kubectl get pods -l app.kubernetes.io/name=logging-operator -n $NS -o jsonpath='{.items[*].status.phase}'| grep "Running"; then
    echo "logger is running"
      exit 0
  fi

	# Sleep for the specified delay, then increment the timer
	sleep $DELAY
	TIMER=$(($TIMER + $DELAY))
done

echo "logger failed to start within 3 minutes"
exit 1
