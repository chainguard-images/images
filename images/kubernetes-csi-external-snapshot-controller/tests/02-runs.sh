#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

NAMESPACE=external-snapshotter

function manifests() {
  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/kubernetes-csi/external-snapshotter/deploy/kubernetes/snapshot-controller?ref=v6.2.2
  - https://github.com/kubernetes-csi/external-snapshotter/deploy/kubernetes/csi-snapshotter?ref=v6.2.2
images:
  - name: registry.k8s.io/sig-storage/snapshot-controller
    newName: ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}
    newTag: ${IMAGE_TAG}
namespace: ${NAMESPACE}
EOF
}

function deploy_snapshot_validation() {
  tmpdir=$(mktemp -d); cd "${tmpdir}"
  curl -sLO https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/deploy/kubernetes/webhook-example/rbac-snapshot-webhook.yaml
  curl -sLO https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/deploy/kubernetes/webhook-example/webhook.yaml
  curl -sLO https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/master/deploy/kubernetes/webhook-example/create-cert.sh

  sed -i "s|namespace: default|namespace: ${NAMESPACE}|g" rbac-snapshot-webhook.yaml
  sed -i "s|namespace: default|namespace: ${NAMESPACE}|g" webhook.yaml
  sed -i "s|registry.k8s.io/sig-storage/snapshot-validation-webhook:v6.2.2|${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}|g" webhook.yaml

  # This script will create a TLS certificate signed by the [cluster](https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/). It will place the public and private key into a secret on the cluster.
  ./create-cert.sh --service snapshot-validation-service --secret snapshot-validation-secret --namespace ${NAMESPACE}

  kubectl apply -f ${tmpdir}
}

manifests

kubectl create namespace ${NAMESPACE}
kubectl apply -k .

kubectl wait --for=condition=ready pod --selector app=snapshot-controller --namespace ${NAMESPACE}
kubectl wait --for=condition=ready pod --selector app=csi-snapshotter --namespace ${NAMESPACE}

deploy_snapshot_validation

kubectl wait --for=condition=ready pod --selector app=snapshot-validation --namespace ${NAMESPACE}
