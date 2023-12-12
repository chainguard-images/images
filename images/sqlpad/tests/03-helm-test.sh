#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}/../"

TMPDIR="$(mktemp -d)"

git clone https://github.com/sqlpad/sqlpad.git "${TMPDIR}/sqlpad"

# Using local patch till postgresql 13.2.24 gets fixed in upstream charts https://github.com/sqlpad/sqlpad/blob/f42ce1a84e1327e69178f38e7b3a2462dcaeeb7c/sqlpad-charts/requirements.yaml#L3
# A PR is also up for that https://github.com/sqlpad/sqlpad/pull/1212
cp patches/helm.patch "${TMPDIR}/sqlpad"

cd "${TMPDIR}/sqlpad" && git apply helm.patch
# Set up a trap to remove the directory on script exit
cleanup() {
    echo "Cleaning up..."
    helm uninstall sqlpad -n sqlpad
    echo "Cleanup complete."
}

# Register the cleanup function to be called on script exit (EXIT signal)
trap cleanup EXIT

cd sqlpad-charts
helm dependency update
helm upgrade --install --namespace sqlpad sqlpad \
    --create-namespace \
    --set image.repository=$IMAGE_REGISTRY_REPO \
    --set image.tag=$IMAGE_TAG \
    ./

# check that sqlpad is up and running app=sqlpad label
kubectl wait --for=condition=ready pod -l app=sqlpad -n sqlpad --timeout=300s