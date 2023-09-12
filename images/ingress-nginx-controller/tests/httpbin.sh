#!/usr/bin/env bash

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

kubectl apply -f $SCRIPT_DIR/httpbin.yaml

echo "Waiting for Deployment..."
kubectl wait --for=condition=ready --timeout=120s pod -l app=httpbin -n ingress-nginx

ingress_ip=""

# There is no kubectl wait for Ingress
for i in {1..10}; do
    echo "Waiting for Ingress..."
    ingress_ip=$(kubectl get ingress ingress-httpbin -n ingress-nginx -ojsonpath='{.status.loadBalancer.ingress[0].ip}')
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
kubectl apply -f $SCRIPT_DIR/curl.yaml
kubectl wait --for=condition=complete --timeout=60s -n ingress-nginx job/curl

echo "Done"
