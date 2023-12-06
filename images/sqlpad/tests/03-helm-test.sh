#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

git clone https://github.com/sqlpad/sqlpad.git && cd sqlpad/sqlpad-charts

# Set up a trap to remove the directory on script exit
cleanup() {
    echo "Cleaning up..."
    rm -rf ../../sqlpad
    cd ../../
    helm uninstall sqlpad -n sqlpad
    echo "Cleanup complete."
}

# Register the cleanup function to be called on script exit (EXIT signal)
trap cleanup EXIT

# Will work only when we use updated version postgresql in upstream charts
helm dependency update

helm -n sqlpad install sqlpad  \
    --namespace sqlpad \
    --create-namespace \
    --set image.repository=$IMAGE_REGISTRY_REPO \
    --set image.tag=$IMAGE_TAG \
    ./

# check that sqlpad is up and running app=sqlpad label
kubectl wait --for=condition=ready pod -l app=sqlpad -n sqlpad --timeout=300s