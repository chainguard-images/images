#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add curl jq
kubectl port-forward --namespace loki svc/loki-gateway 3100:80 &

sleep 5

# Query Loki for logs sent by fluent-bit
response=$(curl -s -G -H "Content-Type: application/json" --data-urlencode 'query={job="fluent-bit"}' http://localhost:3100/loki/api/v1/query)

status=$(echo $response | jq -r '.status')
if [ "$status" == "success" ]; then
    echo "Response status: Success"
else
    echo "Response status: Failure"
    echo "Response: $response"
    exit 1
fi

resultSize=$(echo $response | jq '.data.result | length')
if [ "$resultSize" -gt 0 ]; then
    echo "Success: Found results for the query"
else
    echo "Failure: No results found for the query"
    exit 1
fi
