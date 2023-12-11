#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"

git clone https://github.com/sqlpad/sqlpad.git "${TMPDIR}/sqlpad"

# Set up a trap to remove the directory on script exit
cleanup() {
    echo "Cleaning up..."
    helm uninstall sqlpad -n sqlpad
    echo "Cleanup complete."
}

# Register the cleanup function to be called on script exit (EXIT signal)
trap cleanup EXIT

# Will work only when we use updated version postgresql in upstream charts
helm dependency update

helm upgrade --install --namespace sqlpad sqlpad \
    --create-namespace \
    --set image.repository=$IMAGE_REGISTRY_REPO \
    --set image.tag=$IMAGE_TAG \
    "${TMPDIR}/sqlpad/sqlpad-charts"

# check that sqlpad is up and running app=sqlpad label
kubectl wait --for=condition=ready pod -l app=sqlpad -n sqlpad --timeout=300s