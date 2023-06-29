#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o nounset -o errtrace -o pipefail -x

# add a test deployment to scale based on the cpa algorithm

TMP=$(mktemp -d)
cat <<EOF > ${TMP}/test.yaml
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

kubectl apply -f ${TMP}/test.yaml

cat <<EOF > ${TMP}/values.yaml
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
    --values ${TMP}/values.yaml  \
    --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set image.tag="${IMAGE_TAG}" \
    --set image.pullPolicy=IfNotPresent \
    --set options.target=deployment/nginx-autoscale-example

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cluster-proportional-autoscaler --timeout=120s
