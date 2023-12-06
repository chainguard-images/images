#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

git clone https://github.com/temporalio/helm-charts.git && cd helm-charts

# Set up a trap to remove the directory on script exit
cleanup() {
    echo "Cleaning up..."
    rm -rf ../helm-charts
    cd ..
    helm uninstall temporaltest -n temporaltest
    echo "Cleanup complete."
}

# Register the cleanup function to be called on script exit (EXIT signal)
trap cleanup EXIT

# Will work only when we use updated version postgresql in upstream charts
helm dependencies update

helm -n temporaltest install \
    --set server.replicaCount=1 \
    --namespace temporaltest \
    --create-namespace \
    --set cassandra.config.cluster_size=1 \
    --set prometheus.enabled=false \
    --set grafana.enabled=false \
    --set elasticsearch.enabled=false \
    --set server.image.repository=$IMAGE_REGISTRY_REPO \
    --set server.image.tag=$IMAGE_TAG \
    temporaltest . --timeout 15m

# check that sqlpad is up and running app=sqlpad label
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=temporal -n temporaltest --timeout=15m