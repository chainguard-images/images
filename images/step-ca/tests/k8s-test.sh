#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Function to install step-ca
install_step_ca() {
    helm repo add smallstep https://smallstep.github.io/helm-charts/
    helm repo update
    helm install --create-namespace -n step-ca \
        --set image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} --set image.tag=${IMAGE_TAG} \
        --set command="{/usr/bin/step-ca}" \
        step-certificates smallstep/step-certificates
    # step-certificates smallstep/step-certificates \
}

test_helm_install() {
    # Test if step-ca is installed and pod is ready in a loop
    while ! kubectl -n step-ca get pods -o jsonpath='{.items[1].status.containerStatuses[0].ready}' | grep -q true; do
        sleep 15
    done
}

apk add helm

install_step_ca
test_helm_install
