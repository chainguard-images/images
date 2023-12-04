#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl rollout status \
    --namespace ${NAMESPACE} \
    --timeout 5m \
    daemonset.apps/${NAME}-nrk8s-kubelet

kubectl rollout status \
    --namespace ${NAMESPACE} \
    --timeout 5m \
    daemonset.apps/${NAME}-nrk8s-controlplane

kubectl rollout status \
    --namespace ${NAMESPACE} \
    --timeout 5m \
    deployment.apps/${NAME}-nrk8s-ksm
