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
  helm upgrade --install cg-test \
          prometheus-community/kube-prometheus-stack \
          --set prometheusOperator.prometheusConfigReloader.image.repository=${IMAGE_REPOSITORY} \
          --set prometheusOperator.prometheusConfigReloader.image.registry=${IMAGE_REGISTRY} \
          --set prometheusOperator.prometheusConfigReloader.image.tag=${IMAGE_TAG}

  # Wait for helm to catch up
  sleep 3

  if kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cg-test-kube-prometheus-st-prometheus; then
    echo "Success"
  else
    echo "Failed"
    kubectl describe pod --selector app.kubernetes.io/instance=cg-test-kube-prometheus-st-prometheus
    kubectl logs --selector app.kubernetes.io/instance=cg-test-kube-prometheus-st-prometheus
    exit 1
  fi
  helm uninstall cg-test
}

preflight
TEST_basic_helm_install
