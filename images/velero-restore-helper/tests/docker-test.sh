#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Function to test Velero by creating a backup and restoring it
test_velero() {
  apk add velero-restore-helper

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

  mkdir /restore

  # Create a backup
  velero backup create my-backup --include-namespaces velero -w

  cd /restore

  # Perform restore from the specified directory and capture the restore name
  velero restore create --from-backup my-backup -w >restore_name.txt

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

  # List the contents of the /restore directory
  if ls -1 | grep -q .; then
    echo "Files exist in the /restore directory"
  else
    echo "No files found in the /restore directory"
    exit 1
  fi

}

test_velero
