#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl -n argo-workflows apply -f - <<EOF
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

sleep 3

kubectl -n argo-workflows wait workflows/hello --for condition=Completed --timeout 2m

kubectl logs -n argo-workflows pod/hello
trap "kubectl -n argo-workflows delete workflows/hello" EXIT
