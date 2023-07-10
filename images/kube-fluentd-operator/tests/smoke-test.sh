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
  # Run the command and check for the text
  if kubectl logs -n kfo -l app=log-router --tail -1 -c fluentd | grep "fluentd worker is now running"; then
    echo "Worker is running"
      exit 0
  fi

	# Sleep for the specified delay, then increment the timer
	sleep $DELAY
	TIMER=$(($TIMER + $DELAY))
done

echo "Worker failed to start within 3 minutes"
exit 1
