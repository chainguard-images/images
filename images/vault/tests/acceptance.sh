#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Now unseal vault, which should move it to ready
kubectl exec -n vault-system vault-0 -- vault operator init \
	-key-shares=1 \
	-key-threshold=1 \
	-format=json >cluster-keys.json

KEY=$(jq -r ".unseal_keys_b64[]" cluster-keys.json)
kubectl exec -n vault-system vault-0 -- vault operator unseal $KEY

kubectl wait --for=condition=ready -n vault-system --timeout=120s pod/vault-0
