#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source "$LIBS/libs.sh"

NAMESPACE="k8s-sidecar"
RELEASE_NAME="${1}"
PORT=8080

apk add jq

tmpdir=$(mktemp -d) && cd "$tmpdir"
curl -sLO https://raw.githubusercontent.com/fabianlee/blogcode/master/prometheus/pod-count-dashboard.yaml
sed -i'' -i 's/namespace: prom//g' pod-count-dashboard.yaml

kubectl apply -n ${NAMESPACE} -f pod-count-dashboard.yaml

PASSWORD=$(kubectl get secret ${RELEASE_NAME}-grafana -n ${NAMESPACE} -o jsonpath='{.data.admin-password}' | base64 -d)

kubectl port-forward -n ${NAMESPACE} service/${RELEASE_NAME}-grafana ${PORT}:80 &
pid=$!
trap "kill -9 $pid" EXIT

sleep 5

RESPONSE=$(curl -u admin:${PASSWORD} --retry 5 --retry-all-errors "http://localhost:${PORT}/api/search?query=kubernetes%20pod%20count")

if [ "$(echo "$RESPONSE" | jq length)" -eq 0 ]; then
    echo "Grafana should have at least one Dashboard, exiting..."
    exit 1
fi

echo "$RESPONSE" | jq '.[].title' | grep -i "kubernetes pod count"
