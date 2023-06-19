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

helm repo add deliveryhero https://charts.deliveryhero.io/
helm upgrade --install npd deliveryhero/node-problem-detector \
  --namespace node-problem-detector \
  --create-namespace \
  --set image.repository="${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}" \
  --set image.tag="${IMAGE_TAG}"

sleep 3

# Since we put the `node-problem-detector` binary under /usr/bin/ by default, official image puts it under root / path. So we have to adjust the command to make it work.
# https://github.com/deliveryhero/helm-charts/blob/d2b99b2d0dec9d1d879e99cbd8bffa135eb9b4e6/stable/node-problem-detector/templates/daemonset.yaml#L59-L62
kubectl patch daemonsets.apps npd-node-problem-detector --type='json' -p='[{"op": "remove", "path": "/spec/template/spec/containers/0/command"}, {"op": "add", "path": "/spec/template/spec/containers/0/args", "value": ["--config.system-log-monitor=/config/kernel-monitor.json,/config/docker-monitor.json", "--prometheus-address=0.0.0.0", "--prometheus-port=20257", "--k8s-exporter-heartbeat-period=5m0s"]}]'

sleep 3

kubectl wait --for=condition=ready pod -n node-problem-detector --selector "app.kubernetes.io/name=npd" --timeout=120s
