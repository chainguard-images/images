#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}/../"

TMPDIR="$(mktemp -d)"

git clone https://github.com/sqlpad/sqlpad.git "${TMPDIR}/sqlpad"
cd ${TMPDIR}/sqlpad/sqlpad-charts
helm dependency update
helm upgrade --install --namespace sqlpad sqlpad \
    --create-namespace \
    --set image.repository=$IMAGE_REGISTRY_REPO \
    --set image.tag=$IMAGE_TAG \
    ./

trap "helm uninstall sqlpad -n sqlpad" EXIT

# check that sqlpad is up and running app=sqlpad label
kubectl wait --for=condition=ready pod -l app=sqlpad -n sqlpad --timeout=300s
