#!/usr/bin/env bash

: "${INGRESS_CLASS:=nginx}"

set -o errexit -o nounset -o errtrace -o pipefail -x
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

NAMESPACE="ingress-$INGRESS_CLASS"

# Make sure that Ingresses create in this namespace are managed by the controller
# and webhook in test.
kubectl label namespace $NAMESPACE controllerNamespace=$NAMESPACE

# Webhook doesn't expose Readiness: we will need to retry until webhooks are fully configured.
set +o errexit
for i in {1..10}; do
    sed -e "s/INGRESS_CLASS/$INGRESS_CLASS/g" $SCRIPT_DIR/backend.yaml | kubectl apply -f - -n $NAMESPACE \
        && s=0 && break
    s=$?
    sleep 5
done
if [ $s -ne 0 ]; then
    exit $s
fi
set -o errexit

echo "Waiting for Deployment..."
kubectl rollout status deployment backend -n $NAMESPACE --timeout 3m
kubectl wait --for=condition=ready --timeout=240s pod -l app=backend -n $NAMESPACE

ingress_ip=""

# There is no kubectl wait for Ingress
for i in {1..10}; do
    echo "Waiting for Ingress..."
    ingress_ip=$(kubectl get ingress test-ingress -n $NAMESPACE -ojsonpath='{.status.loadBalancer.ingress[0].ip}')
    if [ -z "$ingress_ip" ]; then
        sleep 15
    else
        break
    fi
done

if [ -z "$ingress_ip" ]; then
    echo "Ingress does not become Ready"
    exit -1
fi

echo "Ingress has IP: $ingress_ip"

echo "Running curl..."
sed -e "s/INGRESS_CLASS/$INGRESS_CLASS/g" $SCRIPT_DIR/curl.yaml | kubectl apply -f - -n $NAMESPACE
kubectl wait --for=condition=complete --timeout=240s -n $NAMESPACE job/curl

echo "Done"
