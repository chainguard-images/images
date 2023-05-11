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
}

preflight

helm repo add dex https://charts.dexidp.io

cat >values.yaml <<EOF
image:
  repository: "${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}"
  tag: "${IMAGE_TAG}"

config:
  issuer: "http://127.0.0.1:5556/dex"

  storage:
    type: memory

  web:
    http: 0.0.0.0:5556

  expiry:
    deviceRequests: "5m"
    signingKeys: "6h"
    idTokens: "24h"
    authRequests: "24h"

  logger:
    level: "info"
    format: "text"

  oauth2:
    responseTypes: [ "code" ]
    skipApprovalScreen: false
    alwaysShowLoginScreen: false

  enablePasswordDB: true

  connectors:
  - type: mockCallback
    id: mock
    name: Example
EOF

helm install --generate-name --wait dex/dex -f values.yaml

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=dex
