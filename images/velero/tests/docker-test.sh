#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x


install_velero(){
  velero install --namespace velero \
               --no-default-backup-location \
               --use-volume-snapshots=false \
               --no-secret \
               --image ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}
}

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

test_velero(){

  wait_for_pod "component=velero" "velero" 300

  VELERO_POD_NAME=$(kubectl get pods -n velero -l component=velero -o jsonpath='{.items[0].metadata.name}')
  STATUS=$(kubectl get pod $VELERO_POD_NAME -n velero -o jsonpath='{.status.phase}')

  if [ "$STATUS" == "Running" ]; then
    echo "Velero pod is running"
  else
    echo "Velero pod is not running"
  fi

  # Create a test backup
  velero backup create my-backup --include-namespaces default

  # Check if the backup is created
  if ! velero backup get | grep -q "my-backup"; then
    echo "Backup creation failed"
    exit 1
  fi

  # Restore the test backup
  velero restore create --from-backup my-backup

  # Check if the restore backup created anything
  if kubectl get restore -n velero; then
    echo "Restore backup created successfully"
  else
    echo "Restore backup not created"
    exit 1
  fi
}

apk add velero velero-compat velero-restore-helper
install_velero
test_velero
