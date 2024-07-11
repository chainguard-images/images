#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Function to test Velero by creating a backup and restoring it
test_velero() {
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

test_velero

