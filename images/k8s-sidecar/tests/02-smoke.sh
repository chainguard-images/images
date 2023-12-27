#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

tmpdir=$(mktemp -d) && cd "$tmpdir"
curl -sLO https://raw.githubusercontent.com/fabianlee/blogcode/master/prometheus/pod-count-dashboard.yaml
sed -i 's/namespace: prom//g' pod-count-dashboard.yaml

kubectl apply -n ${NAMESPACE} -f pod-count-dashboard.yaml

PASSWORD=$(kubectl get secret ${NAME}-grafana -n ${NAMESPACE} -o jsonpath='{.data.admin-password}' | base64 --decode)

kubectl port-forward -n ${NAMESPACE} service/${NAME}-grafana 3000:80 &

sleep 3

RESPONSE=$(curl --retry 5 --retry-all-errors -u admin:${PASSWORD} "http://127.0.0.1:3000/api/search?query=kubernetes%20pod%20count")

if [ "$(echo "$RESPONSE" | jq length)" -eq 0 ]; then
    echo "Grafana should have at least one Dashboard, exiting..."
    exit 1
fi

echo "$RESPONSE" | jq '.[].title' | grep -vi "kubernetes pod count"
