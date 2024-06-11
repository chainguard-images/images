#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat <<EOtask | kubectl create -f -
apiVersion: tekton.dev/v1beta1
kind: TaskRun
metadata:
  name: test-taskrun
spec:
  taskSpec:
    steps:
      - image: ${BUSYBOX_IMAGE}
        script: echo "hello world"
EOtask

kubectl wait --for=condition=succeeded taskrun test-taskrun --timeout=120s