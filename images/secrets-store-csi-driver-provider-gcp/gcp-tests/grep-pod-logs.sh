#!/bin/sh

set -euxo pipefail

eval "$(jq -r '@sh "POD=\(.pod_name) SECRET=\(.secret_data)"')"
exit=1

# Wait up to 5 minutes to see the secret in the pod logs
for i in $(seq 1 30); do
  kubectl logs ${POD} | grep ${SECRET} > /dev/null && exit=0; break
  >&2 echo "Waiting for secret to appear in pod logs..."
  sleep 10
done

jq -n --arg logs "$(kubectl logs ${POD})" '{"logs":$logs}'

exit ${exit}
