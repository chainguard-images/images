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
    # Get the logs from aws-load-balancer-controller before exiting
    kubectl describe pod --selector app.kubernetes.io/instance=aws-load-balancer-controller -n kube-system
    kubectl logs --selector app.kubernetes.io/instance=aws-load-balancer-controller -n kube-system
}

trap cleanup EXIT

helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    --set clusterName=kind-kind -n kube-system --set serviceAccount.create=true  \
    --set region=local \
    --set vpcId=local  \
    --set awsApiEndpoints="ec2=http://amazon-ec2-metadata-mock-service.default" \
    --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
    --set image.tag="${IMAGE_TAG}" \
    --set image.pullPolicy=IfNotPresent

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=aws-load-balancer-controller -n kube-system  --timeout=120s

# sleep again for the leader election
sleep 60 