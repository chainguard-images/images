#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add helm

# Function to retry a command until it succeeds or reaches max attempts
# Arguments:
#   $1: max_attempts
#   $2: interval (seconds)
#   $3: description of the operation
#   ${@:4}: command to execute
retry_command() {
    local max_attempts=$1
    local interval=$2
    local description=$3
    local cmd="${@:4}"
    local attempt=1

    echo "Retrying: $description"
    while [ $attempt -le $max_attempts ]; do
        echo "Attempt $attempt: $cmd"
        if eval $cmd; then
            echo "Success on attempt $attempt for: $description"
            return 0
        else
            echo "Failure on attempt $attempt for: $description"
            sleep $interval
        fi
        ((attempt++))
    done

    # In the event we fail, print out the status of resources in the cluster.
    kubectl get all --all-namespaces
    kubectl events --all-namespaces

    echo "Error: Failed after $max_attempts attempts for: $description"
    return 1
}


# Install cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace ${NAMESPACE} --create-namespace \
    --set image.repository=cgr.dev/chainguard/cert-manager-controller \
    --set image.tag=latest \
    --set cainjector.image.repository=cgr.dev/chainguard/cert-manager-cainjector \
    --set cainjector.image.tag=latest \
    --set acmesolver.image.repository=cgr.dev/chainguard/cert-manager-acmesolver \
    --set acmesolver.image.tag=latest \
    --set webhook.image.repository=cgr.dev/chainguard/cert-manager-webhook \
    --set webhook.image.tag=latest \
    --set installCRDs=true

# Check readiness of cert-manager pods
retry_command 5 15 "cert-manager pod readiness" "kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cert-manager --namespace ${NAMESPACE} --timeout=1m"

# Install k8ssandra-operator
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update
helm install k8ssandra-operator k8ssandra/k8ssandra-operator \
  --namespace ${NAMESPACE} \
  --create-namespace \
  --set image.registry=cgr.dev \
  --set image.repository=chainguard/k8ssandra-operator \
  --set image.tag=latest

# Check readiness of k8sandra-operator
retry_command 5 15 "k8ssandra-operator pod readiness" "kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=k8ssandra-operator --namespace ${NAMESPACE} --timeout=1m"

# Create secret for Medusa
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: medusa-bucket-key
  namespace: ${NAMESPACE}
type: Opaque
stringData:
  credentials: |-
    [default]
    aws_access_key_id = k8ssandra
    aws_secret_access_key = k8ssandra
EOF

# Create K8ssandraCluster
kubectl apply -n ${NAMESPACE} -f - <<EOF
apiVersion: k8ssandra.io/v1alpha1
kind: K8ssandraCluster
metadata:
  name: ${K8SSANDRA_CLUSTER_NAME}
  namespace: ${NAMESPACE}
spec:
  cassandra:
    serverVersion: "4.0.1"
    datacenters:
      - metadata:
          name: k3d
        size: 1
        storageConfig:
          cassandraDataVolumeClaimSpec:
            storageClassName: local-path
            accessModes:
              - ReadWriteOnce
            resources:
              requests:
                storage: 1Gi
        config:
          jvmOptions:
            heapSize: 512M
        stargate:
          size: 1
          heapSize: 256M
          affinity:
            podAntiAffinity:
              preferredDuringSchedulingIgnoredDuringExecution:
                - weight: 1
                  podAffinityTerm:
                    labelSelector:
                      matchLabels:
                        "app.kubernetes.io/name": "stargate"
                    topologyKey: "kubernetes.io/hostname"
  medusa:
    containerImage:
      registry: ${IMAGE_REGISTRY}
      repository: ${IMAGE_REPOSITORY}
      name: ${NAME}
      tag: ${IMAGE_TAG}
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

# Check readiness of the Cassandra Medusa pod
retry_command 5 15 "Cassandra Medusa pod readiness" "kubectl wait --for=condition=Ready pod -l app=${K8SSANDRA_CLUSTER_NAME}-k3d-medusa-standalone -n ${NAMESPACE} --timeout=2m"

# Check readiness of the Cassandra stateful set
retry_command 5 15 "Cassandra stateful set readiness" "kubectl get statefulset ${K8SSANDRA_CLUSTER_NAME}-k3d-default-sts -n ${NAMESPACE} --no-headers -o custom-columns=READY:.status.readyReplicas | grep -q '1'"

# Check Medusa gRPC server startup
kubectl logs -l app=${K8SSANDRA_CLUSTER_NAME}-k3d-medusa-standalone --tail -1 -n ${NAMESPACE} | grep "Starting server. Listening on port 50051"

# Create Medusa Backup
kubectl apply -n ${NAMESPACE} -f - <<EOF
apiVersion: medusa.k8ssandra.io/v1alpha1
kind: MedusaBackup
metadata:
  name: ${NAME}-backup
  namespace: ${NAMESPACE}
spec:
  backupType: full
  cassandraDatacenter: ${NAME}
EOF

# Verify creation of the MedusaBackup resource
retry_command 5 15 "MedusaBackup resource creation" "kubectl get medusabackup -n ${NAMESPACE} 2>&1 | grep -q '${NAME}-backup'"
