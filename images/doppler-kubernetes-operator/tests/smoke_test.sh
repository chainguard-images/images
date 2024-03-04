#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

sleep 5

DELAY=5
NAMESPACE="doppler-operator-system"
CONTROLLER_POD=$(kubectl get pods -n "$NAMESPACE" -o=jsonpath='{.items[0].metadata.name}')
SECRET_NAME="doppler-token-secret"
DUMMY_SECRET_NAME="my-doppler-secret"
TIMER=0
TIMEOUT=60

echo "Step 1: Create a dummy secret in Kubernetes"
kubectl create secret generic "$SECRET_NAME" --from-literal=token="$DUMMY_SECRET_NAME" -n "$NAMESPACE"

echo "Step 2: Checking the operator status..."
kubectl wait --for=condition=Ready pod -n "$NAMESPACE" "$CONTROLLER_POD" --timeout="$TIMEOUT"s

echo "Step 3: Creating the DopplerHQ secret resource..."
cat <<EOF | kubectl apply -f -
apiVersion: secrets.doppler.com/v1alpha1
kind: DopplerSecret
metadata:
  name: $SECRET_NAME
  namespace: $NAMESPACE
spec:
  tokenSecret:
    name: "$SECRET_NAME"
  managedSecret:
    name: "$SECRET_NAME"
    namespace: "$NAMESPACE"
EOF

# Loop until the secret is created or the time limit is reached
while [ $TIMER -lt $TIMEOUT ]; do
  # Check if the secret exists in the namespace
  SECRET=$(kubectl get secret -n "$NAMESPACE" "$SECRET_NAME" --no-headers 2>/dev/null)
  if [ -n "$SECRET" ]; then
    echo "¡The secret $SECRET_NAME was found in the namespace $NAMESPACE!"
    exit 0
  fi

  # Wait the specified delay and then increment the timer
  sleep $DELAY
  TIMER=$(($TIMER + $DELAY))
done

echo "Could not create secret $SECRET_NAME within $TIMEOUT seconds!"
exit 1
