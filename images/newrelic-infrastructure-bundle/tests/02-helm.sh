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
  helm repo add nri-kubernetes https://newrelic.github.io/nri-kubernetes
}


function TEST_basic_helm_install() {
 helm upgrade \
    --install \
    newrelic-infrastructure-bundle nri-kubernetes/newrelic-infrastructure \
    --set images.agent.registry=${IMAGE_REGISTRY} \
    --set images.agent.repository=${IMAGE_REPOSITORY} \
    --set images.agent.tag=${IMAGE_TAG} \
    --set cluster=test \
    --set licenseKey=${NEW_RELIC_LICENSE_KEY}

  # Wait for helm to catch up
  sleep 3

  if kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=newrelic-infrastructure-bundle; then
    echo "Success"
  else
    echo "Failed"
    kubectl describe pod --selector app.kubernetes.io/instance=newrelic-infrastructure-bundle
    kubectl logs --selector app.kubernetes.io/instance=newrelic-infrastructure-bundle
    exit 1
  fi
  helm uninstall newrelic-infrastructure-bundle
}

preflight
TEST_basic_helm_install
