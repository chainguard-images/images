#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x


install_velero(){
  velero install --namespace velero \
               --no-default-backup-location \
               --use-volume-snapshots=false \
               --no-secret \
               --image ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}
}

test_velero(){
  
  CONTAINER_NAME = $(docker ps --format "{{.Names}}" | grep "velero" | head -n 1)
  
  docker exec ${CONTAINER_NAME} /velero backup create my-backup --include-namespace default

  docker exec ${CONTAINER_NAME} /velero restore create --from-backup my-backup

  docker exec ${CONTAINER_NAME} /velero restore get
}

apk add velero velero-compat velero-restore-helper
install_velero
# test_velero
