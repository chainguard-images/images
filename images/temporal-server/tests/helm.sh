#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR=$(mktemp -d)

mkdir -p ${TMPDIR}/helm-charts

# Chart version must match software version
# Make sure that this is the same when the package gets version bumped
git clone https://github.com/temporalio/helm-charts.git --branch v1.22.4 ${TMPDIR}/helm-charts
pushd ${TMPDIR}/helm-charts/

# Set up a trap to remove the directory on script exit
cleanup() {
    echo "Cleaning up..."
    helm uninstall temporaltest -n temporaltest
    rm -rf ${TMPDIR}
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
    temporaltest .

# This is needed because the Temporal Helm chart has a post-install hook that only runs after the main Helm chart is
# finished. That hook is a job required for the pods to become ready. Therefore, we cannot --wait on helm install.
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=temporal -n temporaltest --timeout=15m

popd
