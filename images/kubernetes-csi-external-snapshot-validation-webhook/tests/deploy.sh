#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add curl openssl

curl https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/webhook-example/webhook.yaml |
	sed "s|registry.k8s.io/sig-storage/snapshot-validation-webhook:.*|${IMAGE_NAME}|g" |
	kubectl apply -f -

kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/webhook-example/rbac-snapshot-webhook.yaml

curl -sLO https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${VERSION}/deploy/kubernetes/webhook-example/create-cert.sh
chmod +x ./create-cert.sh
./create-cert.sh --service snapshot-validation-service --secret snapshot-validation-secret

kubectl rollout status deployment snapshot-validation-deployment --timeout=10s
