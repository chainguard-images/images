#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

on_error() {
    echo "An error occurred. Gathering cluster status..."
    kubectl get all --all-namespaces
}

trap 'on_error' ERR

retry_command() {
    # Retires a command for a fixed number of times, before exiting. Used in
    # various areas of this script.
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

    echo "Error: Failed after $max_attempts attempts for: $description"
    return 1
}

TEST_deploy_calico() {
  # Deploys Calico in a k3d cluster (created by imagetest), which has the
  # default CNI (flannel) disabled. None of the pods or nodes will become
  # operational, if Calico was not installed successfully. Note, Calico v3.27,
  # does not contain `key-cert-provisioner`.
  echo "Creating an 'ImageSet' to define which image digests to use for Calico..."
  if [ "$CALICO_VERSION" == "3.27.0" ]; then
    cat <<EOF | kubectl apply -f -
apiVersion: operator.tigera.io/v1
kind: ImageSet
metadata:
  name: calico-v${CALICO_VERSION}
spec:
  images:
    - image: calico/node
      digest: $DIGEST_NODE
    - image: calico/cni
      digest: $DIGEST_CNI
    - image: calico/kube-controllers
      digest: $DIGEST_CONTROLLERS
    - image: calico/pod2daemon-flexvol
      digest: $DIGEST_FLEXVOL
    - image: calico/csi
      digest: $DIGEST_CSI
    - image: calico/typha
      digest: $DIGEST_TYPHA
    - image: calico/apiserver
      digest: $DIGEST_APISERVER
    - image: calico/node-driver-registrar
      digest: $DIGEST_NODE_DRIVER_REGISTRAR
EOF
  else
    cat <<EOF | kubectl apply -f -
apiVersion: operator.tigera.io/v1
kind: ImageSet
metadata:
  name: calico-v${CALICO_VERSION}
spec:
  images:
    - image: calico/node
      digest: $DIGEST_NODE
    - image: calico/cni
      digest: $DIGEST_CNI
    - image: calico/kube-controllers
      digest: $DIGEST_CONTROLLERS
    - image: calico/pod2daemon-flexvol
      digest: $DIGEST_FLEXVOL
    - image: calico/csi
      digest: $DIGEST_CSI
    - image: calico/typha
      digest: $DIGEST_TYPHA
    - image: calico/apiserver
      digest: $DIGEST_APISERVER
    - image: calico/node-driver-registrar
      digest: $DIGEST_NODE_DRIVER_REGISTRAR
    - image: calico/key-cert-provisioner
      digest: $DIGEST_KEY_CERT_PROVISIONER
EOF
  fi

  echo "Deploying new Calico installation..."
  cat <<EOF | kubectl apply -f -
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  variant: Calico
  registry: $IMAGE_REGISTRY
  imagePath: $IMAGE_PATH
  imagePrefix: calico-
EOF

retry_command 5 15 "waiting for 'installation' to reach ready status..." \
  kubectl wait --for=condition=Ready --timeout=5m installation default

retry_command 5 15 "waiting for kube-system pods to reach ready status..." \
  kubectl wait --for=condition=Ready --timeout=5m pod -n kube-system --all

retry_command 5 15 "waiting for calico-system pods to reach ready status..." \
  kubectl wait --for=condition=Ready --timeout=5m pod -n calico-system --all

retry_command 5 15 "waiting for calico-apiserver pods to reach ready status..." \
  kubectl wait --for=condition=Ready --timeout=5m pod -n calico-apiserver --all
}

TEST_log_validation() {
  # Checks each of the Calico pods and looks for known-good log entries, which
  # indicates the service is running.
  retry_command 5 10 "validating logs for calico-apiserver..." \
    kubectl logs -n calico-apiserver -l k8s-app=calico-apiserver | grep "Starting controller"
  
  retry_command 5 10 "validating logs for calico-apiserver..." \
    kubectl logs -n calico-apiserver -l k8s-app=calico-apiserver | grep "Caches are synced"
  
  retry_command 5 10 "validating logs for calico-kube-controllers..." \
    kubectl logs -n calico-system -l app.kubernetes.io/name=calico-kube-controllers | grep "successfully synced"

  retry_command 5 10 "validating logs for calico-kube-controllers..." \
    kubectl logs -n calico-system -l k8s-app=calico-kube-controllers | grep "Caches are synced for nodes"
  
  retry_command 5 10 "validating logs for calico-typha..." \
    kubectl logs -n calico-system -l k8s-app=calico-typha | grep "Received ACK message from client"
  
  retry_command 5 10 "validating logs for calico-driver-registrar..." \
    kubectl logs -n calico-system -c csi-node-driver-registrar -l k8s-app=csi-node-driver | grep "Registration Server started"
}

TEST_deploy_calico
TEST_log_validation
