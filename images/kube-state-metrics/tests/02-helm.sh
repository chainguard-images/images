#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

function preflight() {
  if [[ "${IMAGE_REGISTRY}" == "" ]]; then
    echo "Must set IMAGE_REGISTRY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_REPOSITORY}" == "" ]]; then
    echo "Must set IMAGE_REPOSITORY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_TAG}" == "" ]]; then
    echo "Must set IMAGE_TAG environment variable. Exiting."
    exit 1
  fi
  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
}

function TEST_basic_helm_install() {
  helm upgrade --install cg-test --wait \
          prometheus-community/kube-state-metrics \
          --set image.repository=${IMAGE_REPOSITORY} \
          --set image.registry=${IMAGE_REGISTRY} \
          --set image.tag=${IMAGE_TAG}

  # Wait for helm to catch up
  sleep 3

  if kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cg-test; then
    kubectl port-forward svc/cg-test-kube-state-metrics 8080:8080 &
    pid=$!
    trap "kill $pid" EXIT
    sleep 5
    curl localhost:8080/metrics | grep kube
    echo "Success"
  else
    echo "Failed"
    kubectl describe pod --selector app.kubernetes.io/instance=cg-test
    kubectl logs --selector app.kubernetes.io/instance=cg-test
    exit 1
  fi
  helm uninstall cg-test
}

preflight
TEST_basic_helm_install
