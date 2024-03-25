#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Replace "multus-cni" with the name of your Helm release
HELM_RELEASE="multus-cni"

POD_SPEC='apiVersion: v1
kind: Pod
metadata:
  name: test-pod
spec:
  containers:
  - name: test-container
    image: busybox
    command:
      - /bin/sh
      - -c
      - "trap : TERM INT; (while true; do sleep 1; done) & wait"
    stdin: true
    tty: true
'

# Create the test pod
kubectl apply -f - <<< "$POD_SPEC"

# Wait until the pod is in "Running" state
echo "Waiting for pod to be in 'Running' state..."
while true; do
  POD_STATUS=$(kubectl get pod test-pod -o jsonpath='{.status.phase}')
  if [ "$POD_STATUS" = "Running" ]; then
    break
  fi
  sleep 1
done
echo "Pod is now in 'Running' state."

# Get the IP address of the pod
POD_IP=$(kubectl get pod test-pod -o jsonpath='{.status.podIPs[0].ip}')

# Test network connectivity
echo "Testing connectivity to Google..."
ping -c 3 google.com

# Delete the test pod
kubectl delete pod test-pod

exit 0