#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

helm repo add nvdp https://nvidia.github.io/k8s-device-plugin
helm upgrade --install nvdp nvdp/nvidia-device-plugin \
  --namespace nvidia-device-plugin \
  --create-namespace \
  --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
  --set image.tag="${IMAGE_TAG}"

# Since it's challenging to satisfy the prerequisites as described in the
# https://github.com/NVIDIA/k8s-device-plugin#prerequisites, we'll just wait
# for the Pod to be CrashLoopBackOff and then ensure some of the expected
# output is present in the logs. We cannot kubectl rollout status to wait for
# pods, so sleep and pray instead.

sleep 20

kubectl wait --for=jsonpath='{.status.containerStatuses[0].state.waiting.reason}'=CrashLoopBackOff pod --selector app.kubernetes.io/name=nvidia-device-plugin -n nvidia-device-plugin

POD=$(kubectl get pod -l app.kubernetes.io/name=nvidia-device-plugin -n nvidia-device-plugin -ojsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}'); echo $POD
LOGS=$(kubectl logs "$POD" -n nvidia-device-plugin)

echo "${LOGS}" | grep "Starting FS watcher"
echo "${LOGS}" | grep "Starting OS watcher"
echo "${LOGS}" | grep "Incompatible platform detected"
