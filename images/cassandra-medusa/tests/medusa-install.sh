#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# write a trap function for cleanup helm uninstall
function cleanup() {
  helm uninstall k8ssandra-operator -n ${NAMESPACE}
  helm uninstall cert-manager -n ${CERT}
}

trap cleanup EXIT


# we have to install cert-manager first

helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace ${CERT} --create-namespace --set installCRDs=true

# wait for cert-manager to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cert-manager --namespace ${CERT}

# install k8ssandra-operator
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update

helm install k8ssandra-operator k8ssandra/k8ssandra-operator -n ${NAMESPACE} --create-namespace

sleep 30 

# create a secret, needed for medusa

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
 name: medusa-bucket-key
 namespace: "${NAMESPACE}"
type: Opaque
stringData:
 # Note that this currently has to be set to credentials!
 credentials: |-
   [default]
   aws_access_key_id = k8ssandra
   aws_secret_access_key = k8ssandra
EOF

cat <<EOF | kubectl apply -n ${NAMESPACE} -f -
apiVersion: k8ssandra.io/v1alpha1
kind: K8ssandraCluster
metadata:
  name: demo
  namespace: "${NAMESPACE}"
spec:
  cassandra:
    serverVersion: "4.0.1"
    datacenters:
      - metadata:
          name: dc1
        size: 1
        storageConfig:
          cassandraDataVolumeClaimSpec:
            storageClassName: standard
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
  medusa:
    containerImage:
      registry: ${IMAGE_REGISTRY}
      repository: ${REPOSITORY}
      name: ${NAME}
      tag: latest
      pullPolicy: Always
    storageProperties:
    #   storageProvider: s3_compatible
      bucketName: k8ssandra-medusa
      prefix: test
      storageSecretRef:
        name: medusa-bucket-key
    #   host: minio-service.minio.svc.cluster.local
    #   port: 9000
      secure: false
EOF

# wait for pod using medusa image to come up
kubectl wait --for=condition=ready pod -l app=demo-dc1-medusa-standalone -n ${NAMESPACE}

# check if medusa grpc server started
kubectl logs -l app=demo-dc1-medusa-standalone --tail -1 -n ${NAMESPACE} | grep "Starting server. Listening on port 50051"