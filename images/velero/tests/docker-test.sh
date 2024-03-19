#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x


install_velero(){
  velero install --namespace velero \
               --no-default-backup-location \
               --use-volume-snapshots=false \
               --no-secret \
               --image ${IMAGE_NAME}
}

test_velero(){
  # docker exec "${CONTAINER_NAME}" /velero backup create my-backup --include-namespace default

  # docker exec "${CONTAINER_NAME}" /velero restore create --from-backup my-backup

  # docker exec "${CONTAINER_NAME}" /velero restore get
}

install_velero

test_velero