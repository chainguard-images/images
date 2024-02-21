#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

k8ssandra_operator_release_name=k8ssandra-operator
k8ssandra_operator_release_namespace=k8ssandra-operator

cert_manager_release_name=cert-manager
cert_manager_release_namespace=cert-manager

function cleanup() {
	helm uninstall $k8ssandra_operator_release_name -n $k8ssandra_operator_release_namespace
	helm uninstall $cert_manager_release_name -n $cert_manager_release_namespace
}

trap cleanup EXIT

apk add helm

# we have to install cert-manager first

helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install $cert_manager_release_name jetstack/cert-manager \
	--namespace $cert_manager_release_namespace --create-namespace --set installCRDs=true

# wait for cert-manager to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=cert-manager --namespace $cert_manager_release_namespace

# install cass-operator
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update

helm install $k8ssandra_operator_release_name k8ssandra/k8ssandra-operator -n $k8ssandra_operator_release_namespace --create-namespace

# wait for cass-operator to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=k8ssandra-operator --namespace $k8ssandra_operator_release_namespace
# find the default storage class
defaultStorageClass=$(kubectl get storageclass -o jsonpath='{.items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")].metadata.name}')

cat <<EOF | kubectl apply -n $k8ssandra_operator_release_namespace -f -
apiVersion: k8ssandra.io/v1alpha1
kind: K8ssandraCluster
metadata:
  name: demo
spec:
  auth: false
  reaper:
    containerImage:
      registry: ${IMAGE_REGISTRY}
      repository: ${IMAGE_REPOSITORY}
      tag: ${IMAGE_TAG}
    initContainerImage:
      registry: ${IMAGE_REGISTRY}
      repository: ${IMAGE_REPOSITORY}
      tag: ${IMAGE_TAG}
    httpManagement:
      enabled: true
  cassandra:
    serverVersion: "4.0.1"
    datacenters:
      - metadata:
          name: dc1
        size: 1
        storageConfig:
          cassandraDataVolumeClaimSpec:
            storageClassName: ${defaultStorageClass}
            accessModes:
              - ReadWriteOnce
            resources:
              requests:
                storage: 1Gi
        config:
          jvmOptions:
            heapSize: 256M
EOF
sleep 30

# wait for cassandra to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cassandra-demo --namespace $k8ssandra_operator_release_namespace --timeout=600s

sleep 90

# wait for reaper to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/component=reaper --namespace $k8ssandra_operator_release_namespace --timeout=600s

