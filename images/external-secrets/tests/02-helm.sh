#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMP=$(mktemp -d)

cat <<EOF > "${TMP}/cluster-secret-store.yaml"
---
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: fake
spec:
  provider:
    fake:
      data:
      - key: "/foo/bar"
        value: "HELLO1"
        version: "v1"
      - key: "/foo/bar"
        value: "HELLO2"
        version: "v2"
      - key: "/foo/baz"
        valueMap:
          foo: example
          other: thing
EOF

kubectl apply -f "${TMP}/cluster-secret-store.yaml"

cat <<EOF > "${TMP}/external-secret.yaml"
---
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: example
spec:
  refreshInterval: 1h
  secretStoreRef:
    name: fake
    kind: ClusterSecretStore
  target:
    name: secret-to-be-created
  data:
  - secretKey: foo_bar
    remoteRef:
      key: /foo/bar
      version: v1
  dataFrom:
  - extract:
      key: /foo/baz
EOF

kubectl apply -f "${TMP}/external-secret.yaml"

sleep 5

kubectl get secrets secret-to-be-created -n default -o jsonpath="{.data.foo_bar}" | base64 --decode | grep HELLO1
