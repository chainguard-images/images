#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

git clone https://github.com/yonahd/kor.git

helm upgrade -i kor \
    --namespace kor \
    --create-namespace \
    --set cronJob.enabled=true \
    ./kor/charts/kor