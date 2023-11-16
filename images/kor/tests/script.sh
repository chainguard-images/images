#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

git clone https://github.com/yonahd/kor.git


export KUBECONFIG=$HOME/.kube/config

helm upgrade -i kor \
    --namespace kor \
    --create-namespace \
    --set cronJob.enabled=true \
    ./kor/charts/kor
