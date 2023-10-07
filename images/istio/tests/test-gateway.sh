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

kubectl port-forward -n $ISTIO_NAMESPACE svc/$ISTIO_NAMESPACE-gateway "${FREE_PORT}:80" &
pid=$!
trap "kill -9 $pid" EXIT

set +o errexit
for i in {1..10}; do
    curl --retry 10 localhost:$FREE_PORT -H "Host: ingress.test.foo" && s=0 && break
    s=$?
    sleep 15
done
if [ $s -ne 0 ]; then
    exit $s
fi
