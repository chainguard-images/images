#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# This test requires a few dependencies first: argocd and cert-manager
helm upgrade --install cert-manager cert-manager \
  --repo https://charts.jetstack.io \
  --version 1.11.5 \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true \
  --wait

helm upgrade --install argocd argo-cd \
  --repo https://argoproj.github.io/argo-helm \
  --version 5.46.1 \
  --namespace argocd \
  --create-namespace \
  --set 'configs.secret.argocdServerAdminPassword=$2a$10$5vm8wXaSdbuff0m9l21JdevzXBzJFPCi8sy6OOnpZMAG.fOXL7jvO' \
  --set dex.enabled=false \
  --set notifications.enabled=false \
  --set server.service.type=NodePort \
  --set server.service.nodePortHttp=30080 \
  --wait

  # Install Kargo!
helm upgrade --install kargo \
  oci://ghcr.io/akuity/kargo-charts/kargo \
  --version 0.1.0-rc.21 \
  --namespace kargo \
  --create-namespace \
  --set api.service.type=NodePort \
  --set api.service.nodePort=30084 \
  --set 'api.adminAccount.password=admin' \
  --set image.repository=${IMAGE_REGISTRY}/${IMAGE_REPOSITORY} \
  --set image.tag=${IMAGE_TAG} \
  --wait
