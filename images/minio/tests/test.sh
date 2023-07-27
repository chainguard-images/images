#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

kubectl apply -f $SCRIPT_DIR/100-namespace.yaml
kubectl apply -f $SCRIPT_DIR/200-configmap.yaml
kubectl apply -f $SCRIPT_DIR/200-secret.yaml

sed "s|MINIO_IMAGE|$MINIO_IMAGE|g" $SCRIPT_DIR/300-deploy.yaml | kubectl apply -f -
kubectl apply -f $SCRIPT_DIR/300-service.yaml

# Wait for the server to be up and running.
#
# We need to wrap with retry loop because`kubectl wait` fails immediately if the
# resource has not show up.
for i in {1..5}; do
  kubectl wait --for=condition=ready --timeout=30s \
      pod -n minio -l app=minio && s=0 && break
  s=$?
  sleep 15
done

if [ $s -ne 0 ]; then
  exit $s
fi

# Run the test job to create a bucket and stat it.
sed "s|MC_IMAGE|$MC_IMAGE|g" $SCRIPT_DIR/400-job.yaml | kubectl apply -f -

for i in {1..5}; do
  kubectl wait --for=condition=complete --timeout=30s \
     job -n minio test && s=0 && break
  s=$?
  sleep 15
done

if [ $s -ne 0 ]; then
  exit $s
fi
