#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

: "${ISTIO_NAMESPACE:=istio-system}"

# Create the user namespace
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

sed "s/ISTIO_NAMESPACE/$ISTIO_NAMESPACE/g" $SCRIPT_DIR/virtualservice.yaml \
  | kubectl apply -f- -n $NAMESPACE
kubectl wait --for=condition=complete --timeout=60s -n $NAMESPACE job/curl
