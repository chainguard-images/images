#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

CONTAINER_NAME=${CONTAINER_NAME:-"ip-masq-${FREE_PORT}"}

TMPFILE="$(mktemp -d)/daemonset.yaml"

# Modified from:
# https://raw.githubusercontent.com/kubernetes-sigs/ip-masq-agent/master/ip-masq-agent.yaml
cat > "${TMPFILE}" <<EOF
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: ip-masq-agent
  namespace: "${NAMESPACE}"
spec:
  selector:
    matchLabels:
      k8s-app: ip-masq-agent
  template:
    metadata:
      labels:
        k8s-app: ip-masq-agent
    spec:
      hostNetwork: true
      containers:
      - name: ip-masq-agent
        image: "${IMAGE_NAME}"
        securityContext:
          privileged: false
          capabilities:
            add: ["NET_ADMIN", "NET_RAW"]
        volumeMounts:
          - name: config
            mountPath: /etc/config
      volumes:
        - name: config
          configMap:
            name: ip-masq-agent
            optional: true
            items:
              - key: config
                path: ip-masq-agent
EOF

kubectl create namespace "${NAMESPACE}"

kubectl apply -f "${TMPFILE}"

kubectl rollout status --namespace "${NAMESPACE}" --timeout=5m daemonset/ip-masq-agent

kubectl delete -f "${TMPFILE}"
