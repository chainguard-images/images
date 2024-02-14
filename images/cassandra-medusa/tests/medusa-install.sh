#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The CRDs which are left behind by the helm charts.
crds=(
	"cassandradatacenters.cassandra.datastax.com"
	"cassandratasks.control.k8ssandra.io"
	"clientconfigs.config.k8ssandra.io"
	"k8ssandraclusters.k8ssandra.io"
	"k8ssandratasks.control.k8ssandra.io"
	"medusabackupjobs.medusa.k8ssandra.io"
	"medusabackups.medusa.k8ssandra.io"
	"medusabackupschedules.medusa.k8ssandra.io"
	"medusarestorejobs.medusa.k8ssandra.io"
	"medusatasks.medusa.k8ssandra.io"
	"reapers.reaper.k8ssandra.io"
	"replicatedsecrets.replication.k8ssandra.io"
	"stargates.stargate.k8ssandra.io"
)

# Delete all resources created by the test.
function cleanup() {
	helm uninstall k8ssandra-operator -n ${NAMESPACE}
	helm uninstall cert-manager -n ${NAMESPACE}
	kubectl patch replicatedsecrets.replication.k8ssandra.io ${NAME} -n ${NAMESPACE} -p '{"metadata":{"finalizers":[]}}' --type=merge || true
	kubectl patch k8ssandraclusters.k8ssandra.io ${NAME} -n ${NAMESPACE} -p '{"metadata":{"finalizers":[]}}' --type=merge || true
	kubectl patch cassandradatacenters.cassandra.datastax.com ${NAME} -n ${NAMESPACE} -p '{"metadata":{"finalizers":[]}}' --type=merge || true
	kubectl delete replicatedsecrets.replication.k8ssandra.io ${NAME} -n ${NAMESPACE} || true
	kubectl delete k8ssandraclusters.k8ssandra.io ${NAME} -n ${NAMESPACE} || true
	kubectl delete cassandradatacenters.cassandra.datastax.com ${NAME} -n ${NAMESPACE} || true
	kubectl delete ns ${NAMESPACE} --wait=true

	for crd in "${crds[@]}"; do
		kubectl delete crd $crd
	done
}

trap cleanup EXIT

apk add helm

# we have to install cert-manager first

helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace ${NAMESPACE} --create-namespace --set installCRDs=true

# wait for cert-manager to be ready
kubectl wait --for=condition=ready pod --selector app.kubernetes.io/instance=cert-manager --namespace ${NAMESPACE}

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
            storageClassName: standard
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
# created by the operator. So we can't simply use `kubectl wait`, as it'll fail
# if no pod exists.
for ((i = 0; i < 10; i++)); do
	if kubectl get pod -l app=${NAME}-cassandra-medusa-medusa-standalone -n ${NAMESPACE} &>/dev/null; then
		echo "pod found!"
		exit 0
	else
		echo "pod not found..."
		sleep 15
	fi
done
echo "Pod did not exist after ${RETRY_COUNT} attempts."
exit 1

kubectl wait --for=condition=ready pod -l app=${NAME}-cassandra-medusa-medusa-standalone -n ${NAMESPACE} --timeout=2m

# check if medusa grpc server started
sleep 5
kubectl logs -l app=${NAME}-cassandra-medusa-medusa-standalone --tail -1 -n ${NAMESPACE} | grep "Starting server. Listening on port 50051"
