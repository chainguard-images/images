#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Run a sample pod that sends a message to fluent-bit
kubectl run message \
  --image=cgr.dev/chainguard/fluentd:latest-dev \
  --overrides='
{
  "spec": {
    "containers": [
      {
        "name": "message",
        "image": "cgr.dev/chainguard/fluentd:latest-dev",
        "command": ["sh", "-c"],
        "args": ["echo '\''{\"message\":\"hello\"}'\'' | fluent-cat mytag --host fluent-bit.fluent-bit.svc.cluster.local"]
      }
    ]
  }
}'

sleep 30

# Initialize a flag to check if the log message is found
log_message_found=false

# Get the logs from the fluent-bit pod
LOGS=$(kubectl logs -n fluent-bit $(kubectl get pods --namespace fluent-bit -l "app.kubernetes.io/name=fluent-bit,app.kubernetes.io/instance=fluent-bit" -o jsonpath="{.items[0].metadata.name}"))


# Loop to continually check the logs until the message is found
while [ "$log_message_found" = false ]; do
  if echo "$LOGS" | grep -q '"message":"hello"'; then
    echo "Log message found: Config file changed, reloading..."
    log_message_found=true
  else
    echo "Waiting for log message..."
    sleep 5  # Wait for a few seconds before checking again
    LOGS=$(kubectl logs -n fluent-bit $(kubectl get pods --namespace fluent-bit -l "app.kubernetes.io/name=fluent-bit,app.kubernetes.io/instance=fluent-bit" -o jsonpath="{.items[0].metadata.name}"))
  fi
done
