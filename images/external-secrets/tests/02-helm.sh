#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

function preflight() {
  if [[ "${IMAGE_REGISTRY}" == "" ]]; then
    echo "Must set IMAGE_REGISTRY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_REPOSITORY}" == "" ]]; then
    echo "Must set IMAGE_REPOSITORY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_TAG}" == "" ]]; then
    echo "Must set IMAGE_TAG environment variable. Exiting."
    exit 1
  fi
}

preflight

function cleanup() {
    # Get the logs external-secrets from before exiting
    kubectl describe pod --selector app.kubernetes.io/instance=external-secrets -n external-secrets
    kubectl logs --selector app.kubernetes.io/instance=external-secrets -n external-secrets
}

trap cleanup EXIT

helm repo add external-secrets https://charts.external-secrets.io

helm install external-secrets \
   external-secrets/external-secrets \
    -n external-secrets \
    --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set image.tag="${IMAGE_TAG}" \
    --create-namespace \
    --wait 

cat <<EOF > cluster-secret-store.yaml
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



kubectl apply -f cluster-secret-store.yaml

cat <<EOF > external-secret.yaml
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

kubectl apply -f external-secret.yaml

sleep 5 

kubectl get secrets secret-to-be-created -n default -o jsonpath="{.data.foo_bar}" | base64 --decode | grep HELLO1
