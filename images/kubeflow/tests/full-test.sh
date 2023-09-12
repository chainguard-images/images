#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP=$(mktemp -d)
git clone --depth 1 https://github.com/kubeflow/kubeflow.git ${TMP}/kubeflow

pushd ${TMP}/kubeflow/components || exit

# Install the App

# In the `crud-web-apps` folder, all the directory names uses the
# app name as the prefix, which is first keyword till `-` delimiter.
FOLDER=$(echo ${APP} | cut -d'-' -f1 -)

NAMESPACE=${APP}

function generate() {
  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/kubeflow/kubeflow/components/crud-web-apps/${FOLDER}/manifests/base?ref=master
images:
  - name: docker.io/kubeflownotebookswg/${APP}
    newName: ${IMAGE_REGISTRY_REPO}
    newTag: ${IMAGE_TAG}
namespace: ${NAMESPACE}
EOF
}

generate

kubectl create namespace ${NAMESPACE}
kubectl apply -k .

kubectl wait pods -n ${NAMESPACE} -l app=${APP} --for=condition=Ready --timeout=300s
