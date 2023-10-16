#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

: "${ISTIO_NAMESPACE:=istio-system}"

# Wait for webhooks to be up, as the Helm chart installation
# does not.
kubectl rollout status -n $ISTIO_NAMESPACE deploy/istiod-$ISTIO_NAMESPACE
for i in {1..5}; do
  kubectl get mutatingwebhookconfigurations \
      istio-sidecar-injector-$ISTIO_NAMESPACE-$ISTIO_NAMESPACE \
      && s=0 && break
  s=$?
  sleep 5
done

# Create a test namespace and a pod.
NAMESPACE=$ISTIO_NAMESPACE-users
kubectl apply -f- <<EOF
apiVersion: v1
kind: Namespace
metadata:
  labels:
    # Make sure we use the right controlplane
    istio.io/rev: $ISTIO_NAMESPACE
  name: $NAMESPACE
EOF

POD_NAME=snorlax
kubectl apply -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: $POD_NAME
  namespace: $NAMESPACE
spec:
  containers:
  - args:
    - bin/sleep
    - "36000"
    image: cgr.dev/chainguard/busybox:latest
    name: $POD_NAME
EOF

kubectl wait -n $NAMESPACE pods/$POD_NAME --for=condition=ready --timeout=4m

# Count the number of containers
PODS=$(kubectl get pod -n $NAMESPACE $POD_NAME \
    -ojsonpath='{range .spec.containers[*]}{.image}{"\n"}{end}' \
    | wc -l)

# Must see exactly two ready containers.
if [ "$PODS" -ne "2" ]; then
    exit -1
fi

kubectl delete -n $NAMESPACE pod/$POD_NAME
