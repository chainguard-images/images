#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Image using an init-container to 
INIT_CONTAINER_NAME=${INIT_CONTAINER_NAME:-"testing-velero-plugin-for-aws"}

# Function to install Velero using Minio as the backup storage
install_velero(){
  kubectl apply -f https://raw.githubusercontent.com/vmware-tanzu/velero/main/examples/minio/00-minio-deployment.yaml

  # Create a credentials file for Minio
  cat <<EOF > credentials-velero
  [default]
  aws_access_key_id = minio
  aws_secret_access_key = minio123
EOF

  velero install --bucket velero \
                 --secret-file ./credentials-velero \
                 --use-volume-snapshots=false \
                 --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000 \
                 --provider aws \
                 --plugins velero/velero-plugin-for-aws \
                 --image ${VELERO_IMAGE_REGISTRY}/${VELERO_IMAGE_REPOSITORY}:${VELERO_IMAGE_TAG}

  set -e
  kubectl patch -n velero deployment velero --type='json' \
    -p="[{\"op\": \"replace\", \"path\": \"/spec/template/spec/initContainers/0/image\", \"value\":\"${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}\"}]"
}

# Function to wait for a pod with a specific label to be running
wait_for_pod() {
  local label=$1
  local namespace=$2
  local timeout=$3
  local start_time=$(date +%s)
  local end_time=$((start_time + timeout))

  while true; do
    if [ "$(date +%s)" -gt "$end_time" ]; then
      echo "Timeout waiting for pod with label $label to be created"
      exit 1
    fi

    if kubectl get pods -n "$namespace" -l "$label" 2>/dev/null | grep -q Running; then
      break
    fi

    sleep 5
  done
}

# Function to test Velero by creating a backup and restoring it
test_velero(){

  wait_for_pod "component=velero" "velero" 300

  VELERO_POD_NAME=$(kubectl get pods -n velero -l component=velero -o jsonpath='{.items[0].metadata.name}')
  STATUS=$(kubectl get pod $VELERO_POD_NAME -n velero -o jsonpath='{.status.phase}')

  if [ "$STATUS" == "Running" ]; then
    echo "Velero pod is running"
  else
    echo "Velero pod is not running"
  fi


  kubectl apply -f https://raw.githubusercontent.com/vmware-tanzu/velero/main/examples/nginx-app/base.yaml


  # Create a test backup
  velero backup create nginx-backup --selector app=nginx -w

  # Simulate a disaster
  kubectl delete namespace nginx-example

  # Restore from backup
  velero restore create --from-backup nginx-backup -w
  
  restore_status=$(velero restore get -o json | jq -r '.status.phase')
  if [ "$restore_status" == "Completed" ]; then
    echo "Backup creation successful"
    break
  elif [ "$restore_status" == "Failed" ]; then
    echo "Backup creation failed"
    exit 1
  fi
}

apk add velero velero-compat velero-restore-helper jq
install_velero
test_velero