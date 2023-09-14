#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl apply -f secret-store.yaml
kubectl apply -f external-secret.yaml

sleep 5

kubectl get secrets secret-to-be-created -n default -o jsonpath="{.data.foo_bar}" | base64 --decode | grep HELLO1
