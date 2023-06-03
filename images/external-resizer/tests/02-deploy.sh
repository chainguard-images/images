#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

function TEST_basic_kubectl_apply() {
  tmpdir=$(mktemp -d); cd "${tmpdir}"
  curl -sLO https://raw.githubusercontent.com/kubernetes-csi/external-resizer/master/deploy/kubernetes/deployment.yaml

  sed -i "s|gcr.io/k8s-staging-sig-storage/csi-resizer:canary|${IMAGE_NAME}|g" deployment.yaml

  curl -sLO https://raw.githubusercontent.com/kubernetes-csi/external-resizer/master/deploy/kubernetes/rbac.yaml
  
  kubectl apply -f ${tmpdir}
  
  # Wait for the update to apply
  sleep 3

  if kubectl wait --for=condition=ready pod --selector external-resizer=mock-driver; then
    echo "Success"
  else
    echo "Failed"
    kubectl describe pod --selector external-resizer=mock-driver
    kubectl logs --selector external-resizer=mock-driver
    exit 1
  fi
  rm -rf "${tmpdir}"
}

TEST_basic_kubectl_apply
