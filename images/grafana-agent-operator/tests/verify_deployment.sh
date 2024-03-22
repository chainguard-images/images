#!/usr/bin/env bash
# This test script installs the Grafana Agent Operator without using the Helm chart. It checks if the CRDs are applied and the operator is running correctly.

set -o errexit -o nounset -o errtrace -o pipefail -x
trap 'echo "An error occurred."; cleanup; exit 1' ERR

NAMESPACE="grafana-agent-operator"
CRDS_DIR="./crds"
CRDS_BASE_URL="https://raw.githubusercontent.com/grafana/agent/main/operations/agent-static-operator/crds"
CRDS=(
    "monitoring.coreos.com_podmonitors.yaml"
    "monitoring.coreos.com_probes.yaml"
    "monitoring.coreos.com_servicemonitors.yaml"
    "monitoring.grafana.com_grafanaagents.yaml"
    "monitoring.grafana.com_integrations.yaml"
    "monitoring.grafana.com_logsinstances.yaml"
    "monitoring.grafana.com_metricsinstances.yaml"
    "monitoring.grafana.com_podlogs.yaml"
)

function test_docker_image(){
  docker run --rm "${IMAGE_NAME}" -help
  docker run --rm "${IMAGE_NAME}" -version
}

function download_crds {
    mkdir -p "${CRDS_DIR}"
    for file in "${CRDS[@]}"; do
        echo "Downloading ${file}..."
        curl -sSL -o "${CRDS_DIR}/${file}" "${CRDS_BASE_URL}/${file}"
    done
    echo "Download completed."
}

function apply_crds_and_check {
    kubectl create namespace "${NAMESPACE}" || true
    kubectl apply -f "${CRDS_DIR}" -n "${NAMESPACE}"
    kubectl explain GrafanaAgent -n "${NAMESPACE}" || true
}

function deploy_operator_and_verify {
    kubectl apply -f - <<EOF
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana-agent-operator
  namespace: ${NAMESPACE}
  labels:
    app: grafana-agent-operator
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana-agent-operator
  template:
    metadata:
      labels:
        app: grafana-agent-operator
    spec:
      serviceAccountName: grafana-agent-operator
      containers:
        - name: operator
          image: ${IMAGE_NAME}
          args:
            - --kubelet-service=default/kubelet
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: grafana-agent-operator
  namespace: ${NAMESPACE}
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: grafana-agent-operator
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: grafana-agent-operator
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: grafana-agent-operator
subjects:
  - kind: ServiceAccount
    name: grafana-agent-operator
    namespace: ${NAMESPACE}
EOF

    kubectl rollout status deployment/grafana-agent-operator -n "${NAMESPACE}"
    if ! kubectl wait --for=condition=ready pod -l app=grafana-agent-operator -n "${NAMESPACE}" --timeout=120s; then
        echo "Grafana Agent Operator pods are not ready."
        exit 1
    fi
}

function cleanup {
    echo "Cleaning up..."
    kubectl delete namespace "${NAMESPACE}" || true
    rm -rf "${CRDS_DIR}"
}


# Main
test_docker_image
download_crds
apply_crds_and_check
deploy_operator_and_verify


echo "All checks passed successfully."
cleanup
