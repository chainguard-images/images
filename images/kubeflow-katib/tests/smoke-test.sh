#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TMPDIR="$(mktemp -d)"

function cleanup {
  kubectl delete -k "${TMPDIR}"

  rm -v "${TMPDIR}/kubeflow-katib.yaml" || true
  rm -v "${TMPDIR}/kustomization.yaml" || true
  rmdir "${TMPDIR}"
}
trap cleanup EXIT

# Ref: https://www.kubeflow.org/docs/components/katib/hyperparameter/#installing-katib
NAMESPACE=kubeflow

function manifests {
  # Get the directory path of this script
  envsubst < $SCRIPT_DIR/kubeflow-katib.yaml.tpl > "${TMPDIR}/kubeflow-katib.yaml"
  cat <<EOF > "${TMPDIR}/kustomization.yaml"
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - github.com/kubeflow/katib.git/manifests/v1beta1/installs/katib-standalone?ref=master
images:
  - name: docker.io/kubeflowkatib/katib-controller
    newName: ${IMAGE_REPOSITORY_CONTROLLER}
    newTag: ${IMAGE_REPOSITORY_CONTROLLER_TAG}
  - name: docker.io/kubeflowkatib/katib-db-manager
    newName: ${IMAGE_REPOSITORY_DB_MANAGER}
    newTag: ${IMAGE_REPOSITORY_DB_MANAGER_TAG}
namespace: ${NAMESPACE}
configMapGenerator:
  - name: katib-config
    behavior: replace
    files:
      - katib-config.yaml=kubeflow-katib.yaml
    options:
      disableNameSuffixHash: true
EOF
}

manifests
kubectl apply -k "${TMPDIR}"

kubectl rollout status -n ${NAMESPACE} deployment/katib-db-manager --timeout=200s 
kubectl rollout status -n ${NAMESPACE} deployment/katib-controller --timeout=200s
