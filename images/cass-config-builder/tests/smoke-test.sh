#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# write a trap function for cleanup helm uninstall
function cleanup() {
  helm uninstall k8ssandra-operator -n k8ssandra-operator
  helm uninstall cert-manager -n cert-manager
}

trap cleanup EXIT

# list all the storageclasses

kubectl get storageclass

# we have to install cert-manager first

helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager \
     --namespace cert-manager --create-namespace --set installCRDs=true

# wait for cert-manager to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cert-manager --namespace cert-manager

# install cass-operator
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update

helm install k8ssandra-operator k8ssandra/k8ssandra-operator -n k8ssandra-operator --create-namespace

# wait for cass-operator to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=k8ssandra-operator --namespace k8ssandra-operator

#reapply with new config
current_config_builder=$(kubectl get configmap k8ssandra-operator-cass-operator-manager-config -n k8ssandra-operator -o jsonpath='{.data.image_config\.yaml}' | grep 'config-builder' | awk '{print $2}')
echo $current_config_builder
kubectl get configmap k8ssandra-operator-cass-operator-manager-config -n k8ssandra-operator -o yaml | \
  sed "s|config-builder: ${current_config_builder}|config-builder: ${IMAGE_NAME}|" | \
  kubectl apply -f -

# wait for cass-operator to be ready
kubectl delete pods -n k8ssandra-operator --all
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=k8ssandra-operator --namespace k8ssandra-operator


# find the default storage class
defaultStorageClass=$(kubectl get storageclass -o jsonpath='{.items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")].metadata.name}')

cat <<EOF | kubectl apply -n k8ssandra-operator -f -
apiVersion: k8ssandra.io/v1alpha1
kind: K8ssandraCluster
metadata:
  name: demo
spec:
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
                storage: 5Gi
        config:
          jvmOptions:
            heapSize: 512M
        stargate:
          size: 1
          heapSize: 256M
EOF

sleep 30

# wait for cassandra to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cassandra-demo --namespace k8ssandra-operator --timeout=600s