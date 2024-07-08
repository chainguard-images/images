#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# https://github.com/kubernetes-csi/csi-driver-host-path/blob/master/docs/deploy-1.17-and-later.md
# Function to deploy VolumeSnapshotClasses, VolumeSnapshotContents, VolumeSnapshots CRDs, and snapshot controller
deploy_snapshotter() {
    # Set the snapshotter branch and version
    SNAPSHOTTER_BRANCH="release-6.3"
    SNAPSHOTTER_VERSION="v6.3.3"

    # Apply VolumeSnapshot CRDs
    echo "Applying VolumeSnapshotClasses CRD..."
    kubectl apply -f "https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${SNAPSHOTTER_BRANCH}/client/config/crd/snapshot.storage.k8s.io_volumesnapshotclasses.yaml"

    echo "Applying VolumeSnapshotContents CRD..."
    kubectl apply -f "https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${SNAPSHOTTER_BRANCH}/client/config/crd/snapshot.storage.k8s.io_volumesnapshotcontents.yaml"

    echo "Applying VolumeSnapshots CRD..."
    kubectl apply -f "https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${SNAPSHOTTER_BRANCH}/client/config/crd/snapshot.storage.k8s.io_volumesnapshots.yaml"

    # Create snapshot controller
    echo "Creating snapshot controller..."
    kubectl apply -f "https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${SNAPSHOTTER_VERSION}/deploy/kubernetes/snapshot-controller/rbac-snapshot-controller.yaml"
    kubectl apply -f "https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/${SNAPSHOTTER_VERSION}/deploy/kubernetes/snapshot-controller/setup-snapshot-controller.yaml"

    echo "CSI Snapshotter CRDs and Snapshot Controller have been applied successfully."
}


# Function to install Velero using Minio as the backup storage
install_velero(){
  # find the default storage class
  defaultStorageClass=$(kubectl get storageclass -o jsonpath='{.items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")].metadata.name}')
  kubectl apply -f https://raw.githubusercontent.com/vmware-tanzu/velero/main/examples/minio/00-minio-deployment.yaml

  # Create a credentials file for Minio
  cat <<EOF > credentials-velero
  [default]
  aws_access_key_id = minio
  aws_secret_access_key = minio123
EOF

  wait_for_pod "component=minio" "velero" 300

  deploy_snapshotter

  wait_for_pod "app=snapshot-controller" "kube-system" 300

  echo "Snapshot controller is running"

  velero install --bucket velero \
                 --secret-file ./credentials-velero \
                 --use-volume-snapshots=true \
                 --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc.:9000 \
                 --provider aws \
                 --plugins velero/velero-plugin-for-csi,velero/velero-plugin-for-aws \
                 --image ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG} \
                 --features=EnableCSI

  set -e
  kubectl patch -n velero deployment velero --type='json' \
    -p="[{\"op\": \"replace\", \"path\": \"/spec/template/spec/initContainers/0/image\", \"value\": \"${AWS_IMAGE_REGISTRY}/${AWS_IMAGE_REPOSITORY}:${AWS_IMAGE_TAG}\"}]"
}

# Function to wait for a pod with a specific label to be running
wait_for_pod() {
  local label=$1
  local namespace=$2
  local timeout=$3
  local start_time=$(date +%s)
  local end_time=$((start_time + timeout))

  while true; do
    if [ "$(date +%s)" -gt "$end_time" ]; then
      echo "Timeout waiting for pod with label $label to be created"
      exit 1
    fi

    if kubectl get pods -n "$namespace" -l "$label" 2>/dev/null | grep -q Running; then
      break
    fi

    sleep 5
  done
}

# Function to test Velero by creating a backup and restoring it
test_velero(){

  wait_for_pod "component=velero" "velero" 300

  VELERO_POD_NAME=$(kubectl get pods -n velero -l component=velero -o jsonpath='{.items[0].metadata.name}')
  STATUS=$(kubectl get pod $VELERO_POD_NAME -n velero -o jsonpath='{.status.phase}')
  TEST_NAMESPACE=nginx-example-csi

  if [ "$STATUS" == "Running" ]; then
    echo "Velero pod is running"
  else
    echo "Velero pod is not running"
  fi

  # find the default storage class
  defaultStorageClass=$(kubectl get storageclass -o jsonpath='{.items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")].metadata.name}')

  # create the VolumeSnapshotClass
  cat <<EOF | kubectl apply -f -
    apiVersion: snapshot.storage.k8s.io/v1
    kind: VolumeSnapshotClass
    metadata:
      name: local-path-snapshot-class
    driver: $defaultStorageClass
    deletionPolicy: Delete
    parameters:
      # Replace these with your MinIO S3 storage details and any additional CSI driver parameters
      s3Url: "http://minio.velero.svc.:9000" # Your MinIO service URL
      s3BucketName: "velero" # Your MinIO bucket name for snapshots
      s3Region: "us-east-1"
      s3AccessKey: "minio" # Use Kubernetes secrets for production
      s3SecretKey: "minio123" # Use Kubernetes secrets for production
EOF

# https://raw.githubusercontent.com/vmware-tanzu/velero/main/examples/nginx-app/with-pv.yaml
  cat <<EOk > base.yaml
---
apiVersion: v1
kind: Namespace
metadata:
  name: nginx-example-csi
  labels:
    app: nginx
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nginx-logs
  namespace: nginx-example-csi
  labels:
    app: nginx
spec:
  storageClassName: $defaultStorageClass
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 50Mi
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: nginx-example-csi
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
      annotations:
        pre.hook.backup.velero.io/container: fsfreeze
        pre.hook.backup.velero.io/command: '["/sbin/fsfreeze", "--freeze", "/var/log/nginx"]'
        post.hook.backup.velero.io/container: fsfreeze
        post.hook.backup.velero.io/command: '["/sbin/fsfreeze", "--unfreeze", "/var/log/nginx"]'
    spec:
      volumes:
        - name: nginx-logs
          persistentVolumeClaim:
            claimName: nginx-logs
      containers:
        - image: nginx:1.17.6
          name: nginx
          ports:
            - containerPort: 80
          volumeMounts:
            - mountPath: /var/log/nginx
              name: nginx-logs
              readOnly: false
        - image: ubuntu:bionic
          name: fsfreeze
          securityContext:
            privileged: true
          volumeMounts:
            - mountPath: /var/log/nginx
              name: nginx-logs
              readOnly: false
          command:
            - /bin/bash
            - -c
            - sleep infinity
EOk

  kubectl apply -f base.yaml

  wait_for_pod "app=nginx" "nginx-example-csi" 300

  # Create a test backup
  velero backup create nginx-backup-csi-1 --include-namespaces $TEST_NAMESPACE -w

  # Wait for backup to complete
  echo "Waiting for backup to complete..."

  # Simulate a disaster
  kubectl delete namespace $TEST_NAMESPACE

  # Restore from backup
  velero restore create --from-backup nginx-backup-csi-1 -w

  restore_status=$(velero restore get -o json | jq -r '.status.phase')
  if [ "$restore_status" == "Completed" ]; then
     echo "Restore completed successfully"
     echo "Listing pods and PVCs"
     kubectl get pods,pvc -n $TEST_NAMESPACE

     # check the PVC is already bound to the application and the nginx pod is up and runninng again
     kubectl wait --for=condition=ready pod --selector app=nginx -n $TEST_NAMESPACE
     echo "Backup creation successful"
     exit 0
  elif [ "$restore_status" == "Failed" ]; then
    echo "Backup creation failed"
    exit 1
  fi
}

install_velero
test_velero
