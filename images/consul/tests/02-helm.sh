#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

function preflight() {
  if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
  fi

  helm repo add hashicorp https://helm.releases.hashicorp.com
}

function TEST_basic_helm_install() {
  helm upgrade --install cg-test \
          hashicorp/consul \
          --set global.image=${IMAGE_NAME}

  # Wait for helm to catch up
  sleep 3

  if kubectl wait --for=condition=ready pod --selector app=consul --selector component=server; then
    echo "Success"
  else
    echo "Failed"
    kubectl describe pod --selector app=consul --selector component=server
    kubectl logs --selector app=consul --selector component=server
    exit 1
  fi
  helm uninstall cg-test
}

preflight
TEST_basic_helm_install
