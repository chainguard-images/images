#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR=$(mktemp -d)

mkdir -p ${TMPDIR}/helm-charts

# Chart version must match software version
# Make sure that this is the same when the package gets version bumped
git clone https://github.com/temporalio/helm-charts.git --branch v1.22.4 ${TMPDIR}/helm-charts
pushd ${TMPDIR}/helm-charts/

# Will work only when we use updated version postgresql in upstream charts
helm dependencies update

helm install \
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
kubectl wait --for=condition=ready pod \
    --selector app.kubernetes.io/instance=temporaltest \
    --namespace temporaltest \
    --timeout=15m

popd
