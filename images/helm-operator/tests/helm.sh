#!/usr/bin/env bash
# test helm-operator by installing its helm chart
#

set -o errexit -o nounset -o errtrace -o pipefail -x


helm repo add helm-operator https://bsgrigorov.github.io/helm-operator/

helm install helm-operator helm-operator/helm-operator \
    --namespace helm-operator \
    --set installCRDs=true \
    --version 0.0.2 \
    --wait \


# remove the installed release
trap "helm uninstall helm-operator" EXIT

kubectl apply -f charts/templates/crds/

kubectl set image deployment/helm-operator

kubectl rollout status deployment/helm-operator --timeout=120s

