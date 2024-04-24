#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

apk add helm

# cert-manager is required as a dependency.
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  cert-manager jetstack/cert-manager \
    --namespace ${NAMESPACE} \
    --create-namespace \
    --set image.repository=cgr.dev/chainguard/cert-manager-controller \
    --set image.tag=latest \
    --set cainjector.image.repository=cgr.dev/chainguard/cert-manager-cainjector \
    --set cainjector.image.tag=latest \
    --set acmesolver.image.repository=cgr.dev/chainguard/cert-manager-acmesolver \
    --set acmesolver.image.tag=latest \
    --set webhook.image.repository=cgr.dev/chainguard/cert-manager-webhook \
    --set webhook.image.tag=latest \
    --set installCRDs=true

# wait for cert-manager to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cert-manager --namespace ${NAMESPACE}

# install k8ssandra-operator
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update
helm install k8ssandra-operator k8ssandra/k8ssandra-operator \
  --namespace ${NAMESPACE} \
  --create-namespace \
  --set image.registry=cgr.dev \
  --set image.repository=chainguard/k8ssandra-operator \
  --set image.tag=latest
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
  name: "${NAME}"
  namespace: "${NAMESPACE}"
spec:
  cassandra:
    serverVersion: "4.0.1"
    datacenters:
      - metadata:
          name: "${NAME}"
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

# NOTE: There is usually a delay (up to 60 seconds), before the mesuda pod is
# created by the operator. So we can't immediately run `kubectl wait`, as it'll
# fail if no pod exists.
for ((i = 0; i < 10; i++)); do
	if kubectl get pod -l app=${NAME}-cassandra-medusa-medusa-standalone -n ${NAMESPACE} &>/dev/null; then
		echo "medusa-standalone pod exists, checking readiness..."
        # Wait for pod to be ready before exiting the loop
        if kubectl wait --for=condition=Ready pod -l app=${NAME}-cassandra-medusa-medusa-standalone -n ${NAMESPACE} --timeout=3m; then
            echo "medusa-standalone pod is ready."
            break
        else
            echo "medusa-standalone pod is not ready yet."
        fi
	fi
	sleep 15
done

if [ $i -eq 10 ]; then
    echo "medusa-standalone pod was not ready after ${i} attempts."
    exit 1
fi

# Similarly, the stateful set may take a while to be created, so we need to
# first check for it's presence, before checking that the statefulset is ready.
for ((i = 0; i < 20; i++)); do
  if kubectl get statefulset ${NAME}-cassandra-medusa-default-sts -n ${NAMESPACE} &>/dev/null; then
    echo "cassandra-medusa statefulset exists, checking readiness..."
    if ready_statefulset=$(kubectl get statefulset ${NAME}-cassandra-medusa-default-sts -n ${NAMESPACE} --no-headers -o custom-columns=READY:.status.readyReplicas); then
        if [ "$ready_statefulset" -ge 1 ]; then
            echo "cassandra-medusa statefulset is ready."
            break
        else
            echo "cassandra-medusa statefulset is not ready yet."
        fi
    else
        echo "Error fetching the status of the statefulset."
    fi
  fi
	sleep 30
done

if [ $i -eq 10 ]; then
    echo "cassandra-medusa statefulset was not ready after ${i} attempts."
    exit 1
fi

# check if medusa grpc server started
sleep 5
kubectl logs -l app=${NAME}-cassandra-medusa-medusa-standalone --tail -1 -n ${NAMESPACE} | grep "Starting server. Listening on port 50051"

# Create Medusa Backup
cat <<EOF | kubectl apply -n ${NAMESPACE} -f -
apiVersion: medusa.k8ssandra.io/v1alpha1
kind: MedusaBackup
metadata:
  name: "${NAME}-backup"
  namespace: "${NAMESPACE}"
spec:
  backupType: full
  cassandraDatacenter: "${NAME}"
EOF

# Check if the MedusaBackup resource was created. Note medusa only supports
# Cloud storage backends, so all we can do at this point is check the backup
# job was created.
for ((i = 0; i < 10; i++)); do
    output=$(kubectl get medusabackup -n ${NAMESPACE} 2>&1)
    if echo "$output" | grep -q "cassandra-medusa-backup"; then
        echo "medusa backup task was successfully created."
        break
    else
        sleep 15
    fi
done

if [ $i -eq 10 ]; then
    echo "Failed to find medusa backup task after 10 attempts."
    exit 1
fi
