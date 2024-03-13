#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

cat <<EOF | kubectl --namespace argo-workflows apply --filename -
apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  name: hello
spec:
  entrypoint: main # the first template to run in the workflows
  templates:
  - name: main
    container: # this is a container template
      image: docker/whalesay # this image prints "hello world" to the console
      command: ["cowsay"]
      args: [ "hello world" ]
EOF

kubectl wait --for=condition=Completed workflows/hello \
  --namespace argo-workflows \
  --timeout 2m

kubectl logs --namespace argo-workflows pod/hello
trap "kubectl --namespace argo-workflows delete workflows/hello" EXIT
