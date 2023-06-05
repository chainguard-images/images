#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

function preflight() {
  if [[ "${IMAGE_REGISTRY}" == "" ]]; then
    echo "Must set IMAGE_REGISTRY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_REPOSITORY}" == "" ]]; then
    echo "Must set IMAGE_REPOSITORY environment variable. Exiting."
    exit 1
  fi

  if [[ "${IMAGE_TAG}" == "" ]]; then
    echo "Must set IMAGE_TAG environment variable. Exiting."
    exit 1
  fi
}

preflight

function cleanup() {
    # Get the logs from cluster-proportional-autoscaler before exiting
    kubectl describe pod --selector app.kubernetes.io/instance=cluster-proportional-autoscaler
    kubectl logs --selector app.kubernetes.io/instance=cluster-proportional-autoscaler
}

trap cleanup EXIT
# add a test deployment to scale based on the cpa algorithm

cat <<EOF > test.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-autoscale-example
  namespace: default
spec:
  selector:
    matchLabels:
      run: nginx-autoscale-example
  replicas: 1
  template:
    metadata:
      labels:
        run: nginx-autoscale-example
    spec:
      containers:
      - name: nginx-autoscale-example
        image: nginx
        ports:
        - containerPort: 80
EOF

kubectl apply -f test.yaml

cat <<EOF > values.yaml
config:
   linear:
     coresPerReplica: 2
     nodesPerReplica: 1
     min: 1
     max: 100
     preventSinglePointFailure: true
     includeUnschedulableNodes: true
EOF

helm repo add cluster-proportional-autoscaler https://kubernetes-sigs.github.io/cluster-proportional-autoscaler
helm repo update

helm upgrade --install cluster-proportional-autoscaler cluster-proportional-autoscaler/cluster-proportional-autoscaler \
    --values values.yaml  \
    --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set image.tag="${IMAGE_TAG}" \
    --set image.pullPolicy=IfNotPresent \
    --set options.target=deployment/nginx-autoscale-example

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cluster-proportional-autoscaler --timeout=120s
