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
  helm repo add nri-kube-events https://newrelic.github.io/nri-kube-events
}


function TEST_basic_helm_install() {
 helm upgrade \
    --install \
    newrelic-k8s-events-forwarder nri-kube-events/nri-kube-events \
    --set images.integration.registry=${IMAGE_REGISTRY} \
    --set images.integration.repository=chainguard/nri-kube-events \
    --set images.integration.tag=latest \
    --set images.agent.registry=${IMAGE_REGISTRY} \
    --set images.agent.repository=${IMAGE_REPOSITORY} \
    --set images.agent.tag=${IMAGE_TAG} \
    --set cluster=test \
    --set licenseKey=${NEW_RELIC_LICENSE_KEY}

  # Wait for helm to catch up
  sleep 3

  if kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=newrelic-k8s-events-forwarder; then
    echo "Success"
  else
    echo "Failed"
    kubectl describe pod --selector app.kubernetes.io/instance=newrelic-k8s-events-forwarder
    kubectl logs --selector app.kubernetes.io/instance=newrelic-k8s-events-forwarder
    exit 1
  fi
  helm uninstall newrelic-k8s-events-forwarder
}

preflight
TEST_basic_helm_install
