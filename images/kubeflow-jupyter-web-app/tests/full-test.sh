#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP=$(mktemp -d)
git clone --depth 1 https://github.com/kubeflow/kubeflow.git ${TMP}/kubeflow

pushd ${TMP}/kubeflow/components || exit

# install istio
./testing/gh-actions/install_istio.sh

cd ./crud-web-apps/jupyter/manifests
kubectl create ns kubeflow
export CURRENT_JWA_IMG=docker.io/kubeflownotebookswg/jupyter-web-app:latest
export PR_JWA_IMG=${IMAGE_NAME}
kustomize build overlays/istio | sed "s#$CURRENT_JWA_IMG#$PR_JWA_IMG#g" | kubectl apply -f -
kubectl wait pods -n kubeflow -l app=jupyter-web-app --for=condition=Ready --timeout=300s