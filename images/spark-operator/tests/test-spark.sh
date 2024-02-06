#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

REQUEST_RETRIES=10
RETRY_DELAY=15

expected_logs=(
  "Driver spark-pi-driver is running"
  "Starting processing key"
  "Ending processing key"
)
missing_logs=()

# Looks for known, good log entries. Fails the script if not found after a
# number of retries.
check_logs() {
  for log_entry in "${expected_logs[@]}"; do
    local retries=${REQUEST_RETRIES}
    local found=0
    while [ $retries -gt 0 ]; do
      if kubectl logs -l app.kubernetes.io/name=spark-operator -n "${NAMESPACE}" | grep -q "${log_entry}"; then
        found=1
        break
      else
        retries=$((retries-1))
        sleep ${RETRY_DELAY}
      fi
    done

    if [ $found -eq 0 ]; then
      missing_logs+=("${log_entry}")
    fi
  done

  if [ ${#missing_logs[@]} -ne 0 ]; then
    echo "The following expected log entries were not found after all retries:"
    for missing_log in "${missing_logs[@]}"; do
      echo "- ${missing_log}"
    done
    exit 1
  fi
}

# Deploys the required k8s resources.
apply_manifests() {
  kubectl apply -f - <<-EOF
	apiVersion: v1
	kind: Namespace
	metadata:
	  name: ${NAMESPACE}
	---
	apiVersion: v1
	kind: ServiceAccount
	metadata:
	  name: spark-pi
	  namespace: ${NAMESPACE}
	---
  apiVersion: rbac.authorization.k8s.io/v1
  kind: ClusterRole
  metadata:
    name: spark-pi
  rules:
  - apiGroups: [""]
    resources: ["pods", "services", "configmaps", "secrets", "events"]
    verbs: ["*"]
  - apiGroups: ["sparkoperator.k8s.io"]
    resources: ["sparkapplications", "scheduledsparkapplications", "sparkapplications/status"]
    verbs: ["*"]
	---
  apiVersion: rbac.authorization.k8s.io/v1
  kind: ClusterRoleBinding
  metadata:
    name: spark-pi
  subjects:
  - kind: ServiceAccount
    name: spark-pi
    namespace: ${NAMESPACE}
  roleRef:
    kind: ClusterRole
    name: spark-pi
    apiGroup: rbac.authorization.k8s.io
	---
	apiVersion: rbac.authorization.k8s.io/v1
	kind: ClusterRole
	metadata:
	  name: spark-operator-clusterrole
	rules:
	- apiGroups: [""]
	  resources: ["pods", "services", "configmaps", "secrets"]
	  verbs: ["get", "watch", "list", "create", "delete", "patch", "update"]
	- apiGroups: ["sparkoperator.k8s.io"]
	  resources: ["sparkapplications", "scheduledsparkapplications"]
	  verbs: ["get", "watch", "list", "create", "delete", "patch", "update"]
	---
	apiVersion: rbac.authorization.k8s.io/v1
	kind: ClusterRoleBinding
	metadata:
	  name: spark-operator-clusterrolebinding
	subjects:
	- kind: ServiceAccount
	  name: spark-operator
	  namespace: ${NAMESPACE}
	roleRef:
	  kind: ClusterRole
	  name: spark-operator-clusterrole
	  apiGroup: rbac.authorization.k8s.io
	---
	apiVersion: "sparkoperator.k8s.io/v1beta2"
	kind: SparkApplication
	metadata:
	  name: spark-pi
	  namespace: ${NAMESPACE}
	spec:
	  type: Scala
	  mode: cluster
	  image: ${IMAGE}
	  imagePullPolicy: Always
	  mainClass: org.apache.spark.examples.SparkPi
	  mainApplicationFile: "local:///opt/spark/examples/jars/spark-examples_2.12-3.1.1.jar"
	  sparkVersion: "3.1.1"
	  restartPolicy:
	    type: Never
	  volumes:
	    - name: "test-volume"
	      hostPath:
	        path: "/tmp"
	        type: Directory
	  driver:
	    cores: 1
	    coreLimit: "1200m"
	    memory: "512m"
	    labels:
	      version: 3.1.1
	    serviceAccount: spark-pi
	    volumeMounts:
	      - name: "test-volume"
	        mountPath: "/tmp"
	  executor:
	    cores: 1
	    instances: 1
	    memory: "512m"
	    labels:
	      version: 3.1.1
	    volumeMounts:
	      - name: "test-volume"
	        mountPath: "/tmp"
	EOF
}

function cleanup() {
  kubectl delete clusterrole spark-pi
  kubectl delete clusterrole spark-operator-clusterrole
  kubectl delete clusterrolebinding spark-pi
  kubectl delete clusterrolebinding spark-operator-clusterrolebinding
  kubectl delete sparkapplication spark-pi -n ${NAMESPACE}
  helm uninstall spark -n ${NAMESPACE}
  helm uninstall spark-operator -n ${NAMESPACE}
  kubectl delete ns ${NAMESPACE}
  kubectl delete crd scheduledsparkapplications.sparkoperator.k8s.io
  kubectl delete crd sparkapplications.sparkoperator.k8s.io
}

trap cleanup EXIT

# Apply the Kubernetes manifests
apply_manifests
check_logs
