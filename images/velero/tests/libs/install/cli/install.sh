#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add velero jq kubectl kustomize

# Install minio dependency
kubectl apply -f https://raw.githubusercontent.com/vmware-tanzu/velero/main/examples/minio/00-minio-deployment.yaml

# Wait for the job to complete
kubectl wait --for=condition=complete --timeout=600s -n velero job/minio-setup

# Install VolumeSnapshot related things
kustomize build https://github.com/kubernetes-csi/external-snapshotter/client/config/crd?ref=master | kubectl apply --wait -f -

# Install the snapshot controller
kustomize build https://github.com/kubernetes-csi/external-snapshotter/deploy/kubernetes/snapshot-controller?ref=master | kubectl apply --wait -n kube-system -f -

creds_path=$(mktemp)

# Create a credentials file for Minio
cat <<EOF >"$creds_path"
  [default]
  aws_access_key_id = minio
  aws_secret_access_key = minio123
EOF

velero install --wait --bucket velero \
  --secret-file "$creds_path" \
  --use-volume-snapshots=true \
  --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000 \
  --provider aws \
  --plugins ${PLUGINS} \
  --features=EnableCSI \
  --image ${VELERO_IMAGE_REGISTRY}/${VELERO_IMAGE_REPOSITORY}:${VELERO_IMAGE_TAG}
