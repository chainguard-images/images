#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

git clone https://github.com/yonahd/kor.git

# Set up a trap to remove the directory on script exit
cleanup() {
    echo "Cleaning up..."
    rm -rf kor
    helm uninstall kor -n kor
    echo "Cleanup complete."
}

# Register the cleanup function to be called on script exit (EXIT signal)
trap cleanup EXIT

helm upgrade -i kor \
    --namespace kor \
    --create-namespace \
    --set cronJob.enabled=true \
    --set cronJob.image.repository=$IMAGE_REGISTRY_REPO \
    --set cronJob.image.tag=$IMAGE_TAG \
    --set prometheusExporter.enabled=true \
    --set prometheusExporter.deployment.image.repository=$IMAGE_REGISTRY_REPO \
    --set prometheusExporter.deployment.image.tag=$IMAGE_TAG \
    ./kor/charts/kor

# check that kor is up and running app=kor-exporter label
kubectl wait --for=condition=ready pod -l app=kor-exporter -n kor --timeout=300s
