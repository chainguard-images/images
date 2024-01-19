#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# do trap and cleanup manifests using kubectl delete
function cleanup() {
  kubectl delete -k ${TMP}
  rm -rf ${TMP}
}

TMP=$(mktemp -d)
NAMESPACE=${NAMESPACE:-kubeflow}
pushd ${TMP}

function generate() {
  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/kubeflow/kubeflow/components/centraldashboard/manifests/base?ref=master
images:
  - name: docker.io/kubeflownotebookswg/centraldashboard
    newName: ${IMAGE_REGISTRY_REPO}
    newTag: ${IMAGE_TAG}
namespace: ${NAMESPACE}
EOF
}

kubectl create namespace ${NAMESPACE}
generate
kubectl apply -k ./

# wait for deployment to be ready use rollout status
kubectl rollout status deployment/centraldashboard -n ${NAMESPACE}


trap cleanup EXIT