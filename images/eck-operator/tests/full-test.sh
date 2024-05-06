#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# deploy the Elasticsearch instance

cat <<EOF | kubectl apply -f -
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 8.13.3
  nodeSets:
  - name: default
    count: 1
    config:
      node.store.allow_mmap: false
EOF

# wait a couple of seconds for the Elasticsearch instance to be created
sleep 30

# wait for the Elasticsearch instance to be ready
kubectl wait --for=condition=ready pod --selector elasticsearch.k8s.elastic.co/cluster-name=quickstart --timeout=5m

# get credentials
PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')

# port forward
kubectl port-forward service/quickstart-es-http 9200:9200 &

# wait for port forward to be ready
max_retries=10
count=0
echo "Waiting for Elasticsearch to start on port 9200..."
while ! curl -s -k https://localhost:9200 > /dev/null; do
    count=$((count+1))
    if [ "$count" -ge "$max_retries" ]; then
        echo "Failed to connect to Elasticsearch on port 9200 after $max_retries attempts."
        exit 1
    fi
    sleep 1
    echo -n "."
done

# Store the expected JSON object in a variable
expected_json='
{
  "name" : "quickstart-es-default-0",
  "cluster_name" : "quickstart",
  "tagline" : "You Know, for Search"
}
'

# Use cURL and jq to fetch and format the JSON output, selecting only the specified fields
curl_output=$(curl -u "elastic:$PASSWORD" -k "https://localhost:9200" | jq '{name, cluster_name, tagline}')

# Compare the output with the expected JSON object
if [ "$expected_json" = "$curl_output" ]; then
  echo "The output matches the expected JSON."
else
  echo "The output does not match the expected JSON."
fi
