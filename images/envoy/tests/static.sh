#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Create namespace and deployment.
: "${NAMESPACE:=default}"
kubectl create ns $NAMESPACE || true
sed "s|IMAGE_NAME|$IMAGE_NAME|g" $SCRIPT_DIR/static.yaml \
    | kubectl apply -n $NAMESPACE -f-

# The readiness check actually verifies Envoy serving
# the static config, we only need to wait for deployment
# to be ready.
kubectl rollout status deployment -n $NAMESPACE envoy
