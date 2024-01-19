#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Wait for the pod to be running before we try to unseal, we can't use `kubectl wait` here
count=0
limit=40
while [[ $(kubectl get pods -l app.kubernetes.io/name=vault -n ${NAMESPACE} -o 'jsonpath={..status.phase}') != "Running" ]] && [[ $count -lt $limit ]]; do
	sleep 3
	count=$(($count + 1))
done

if [[ $count -eq $limit ]]; then
	echo "Pod did not become Running after $count tries"
	exit 1
fi

# Now unseal vault, which should move it to ready
kubectl exec -n ${NAMESPACE} ${NAME}-0 -- vault operator init \
	-key-shares=1 \
	-key-threshold=1 \
	-format=json >cluster-keys.json

KEY=$(jq -r ".unseal_keys_b64[]" cluster-keys.json)
kubectl exec -n ${NAMESPACE} ${NAME}-0 -- vault operator unseal $KEY

kubectl wait --for=condition=ready -n ${NAMESPACE} --timeout=120s pod/${NAME}-0
