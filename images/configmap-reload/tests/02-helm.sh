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
          prometheus-community/alertmanager \
          --set configmapReload.enabled=true \
          --set configmapReload.image="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
          --set configmapReload.tag="${IMAGE_TAG}"

  # Wait for helm to catch up
  sleep 3

  if kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=alertmanager ; then
    echo "Success"
  else
    echo "Failed"
    kubectl describe pod --selector app.kubernetes.io/name=alertmanager
    kubectl logs --selector app.kubernetes.io/name=alertmanager
    exit 1
  fi

  helm uninstall cg-test
}

preflight
TEST_basic_helm_install
