#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Function to test Velero by creating a backup and restoring it
test_velero() {
  TEST_NAMESPACE=nginx-example-csi

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
  cat <<EOk >base.yaml
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

  kubectl wait --for=condition=ready pod --selector app=nginx -n $TEST_NAMESPACE

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

test_velero
