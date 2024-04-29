#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Smoke test for https://github.com/wave-k8s/wave?tab=readme-ov-file#quick-start

TEST_DEPLOYMENT_NAME="wave-smoke-test"
WAVE_ANNOTATION="wave.pusher.com/update-on-config-change"
WAVE_CONFIG_HASH_ANNOTATION="wave\.pusher\.com/config-hash"

kubectl create configmap ${TEST_DEPLOYMENT_NAME}-config --from-literal=foo=bar

kubectl create deployment ${TEST_DEPLOYMENT_NAME} --image=cgr.dev/chainguard/nginx:latest --replicas=1 --dry-run=client -o yaml | kubectl apply -f -

kubectl patch deployment ${TEST_DEPLOYMENT_NAME} --type=json -p='[{"op": "add", "path": "/spec/template/spec/volumes", "value": [{"name": "config-volume", "configMap": {"name": "'${TEST_DEPLOYMENT_NAME}'-config"}}]}]'

kubectl annotate deployment ${TEST_DEPLOYMENT_NAME} ${WAVE_ANNOTATION}="true"

kubectl rollout restart deployment ${TEST_DEPLOYMENT_NAME}

kubectl rollout status deployment ${TEST_DEPLOYMENT_NAME} --timeout=60s

# Wait a while until the wave operator updates the Deployment's PodTemplate.
sleep 15

initial_hash=$(kubectl get deployment ${TEST_DEPLOYMENT_NAME} -o jsonpath="{.spec.template.metadata.annotations['${WAVE_CONFIG_HASH_ANNOTATION}']}")

if [ -z "$initial_hash" ]; then
  echo "[!] The Deployment's PodTemplate was not set by the wave operator"
  exit 1
fi

# Update the ConfigMap and check if the Deployment's PodTemplate is updated by the wave operator.
kubectl patch configmap ${TEST_DEPLOYMENT_NAME}-config --type merge -p '{"data": {"foo": "baz"}}'

kubectl rollout status deployment ${TEST_DEPLOYMENT_NAME} --timeout=60s

new_hash=$(kubectl get deployment ${TEST_DEPLOYMENT_NAME} -o jsonpath="{.spec.template.metadata.annotations['${WAVE_CONFIG_HASH_ANNOTATION}']}")

if [ -z "$new_hash" ]; then
  echo "[!] The Deployment's PodTemplate was not set by the wave operator"
  exit 1
fi

# Ensure the Deployment's PodTemplate was updated by the wave operator by comparing the initial and new hash.
if [ "$initial_hash" == "$new_hash" ]; then
  echo "[!] The Deployment's PodTemplate was not updated by the wave operator"
  exit 1
fi
