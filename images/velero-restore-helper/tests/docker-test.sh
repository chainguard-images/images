#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

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
                 --plugins velero/velero-plugin-for-aws:v1.9.1 \
                 --image ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}
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

  cat <<EOF | kubectl apply -f -
  apiVersion: v1
  kind: ConfigMap
  metadata:
    name: fs-restore-action-config
    namespace: velero
    labels:
      velero.io/plugin-config: ""
      velero.io/pod-volume-restore: RestoreItemAction
  data:
    image: ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}
    cpuRequest: "200m"
    memRequest: "128Mi"
    cpuLimit: "200m"
    memLimit: "128Mi"
    secCtxRunAsUser: "1001"
    secCtxRunAsGroup: "999"
    secCtxAllowPrivilegeEscalation: "false"
    secCtx: |
      capabilities:
        drop:
        - ALL
      allowPrivilegeEscalation: "false"
      readOnlyRootFilesystem: "true"
      runAsUser: 1001
      runAsGroup: 999
EOF


  mkdir restore

  # Create a backup
  velero backup create my-backup --include-namespaces velero -w

  cd /restore

  # Perform restore from the specified directory and capture the restore name
  velero restore create --from-backup my-backup -w > restore_name.txt

  # Wait for the restore to complete
  while true; do
    restore_status=$(velero restore get -o json | jq -r '.status.phase')
    if [ "$restore_status" == "Completed" ]; then
      echo "Restore completed successfully"
      break
    elif [ "$restore_status" == "Failed" ]; then
      echo "Restore failed"
      exit 1
    fi
    sleep 10
  done

  # List the contents of the /restore directory and check if any output is produced
  if ls -1 | grep -q .; then
    echo "Files exist in the /restore directory"
  else
    echo "No files found in the /restore directory"
  fi

}

apk add velero velero-compat velero-restore-helper jq
install_velero
test_velero
