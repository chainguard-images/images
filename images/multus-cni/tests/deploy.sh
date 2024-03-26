#!/bin/bash

# Function to check pod status
check_pod_status() {
    local pod_name="$1"
    local namespace="$2"
    kubectl get pod "$pod_name" -n "$namespace" &>/dev/null
}

# Function to delete the pod if it exists
delete_pod_if_exists() {
    local pod_name="$1"
    local namespace="$2"
    if check_pod_status "$pod_name" "$namespace"; then
        kubectl delete pod "$pod_name" -n "$namespace" &>/dev/null
    fi
}

# Apply the Multus CNI DaemonSet manifest
kubectl apply -f https://raw.githubusercontent.com/k8snetworkplumbingwg/multus-cni/master/deployments/multus-daemonset-thick.yml  &>/dev/null

NAMESPACE="multus"
kubectl create namespace "$NAMESPACE" &>/dev/null
kubectl create serviceaccount multus -n "$NAMESPACE" &>/dev/null

cat <<EOF > multus-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: multus-test-pod
  namespace: $NAMESPACE
  annotations:
    k8s.v1.cni.cncf.io/networks: '[{"name":"flannel-network"},{"name":"default-network"}]'
spec:
  serviceAccountName: multus
  containers:
  - name: multus-test-container
    image: busybox
    command:
      - sleep
      - "3600"
    stdin: true
    tty: true
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
EOF

kubectl apply -f multus-pod.yaml &>/dev/null

# Total time to wait in seconds (3 minutes)
TOTAL_WAIT_TIME=$((3 * 60))

# Waiting time between checks in seconds (5 seconds)
WAIT_INTERVAL=5

# Total expected time
TOTAL_WAITED=0

# pod name
POD_NAME="multus-test-pod"

while [ $TOTAL_WAITED -lt $TOTAL_WAIT_TIME ]; do
    # Get pod status
    POD_STATUS=$(kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o jsonpath='{.status.phase}')

    # Check if the status is 'Running'
    if [ "$POD_STATUS" == "Running" ]; then
        echo "The pod is in Running state."
        
        # Test connectivity from the pod to another resource within the cluster
        kubectl exec "$POD_NAME" -n "$NAMESPACE" -- sh -c "ping -c 3 google.com"

        # Check if the pod still exists before trying to delete it
        if check_pod_status "$POD_NAME" "$NAMESPACE"; then
            delete_pod_if_exists "$POD_NAME" "$NAMESPACE"
        fi

        # Delete the Multus CNI DaemonSet
        kubectl delete -f https://raw.githubusercontent.com/k8snetworkplumbingwg/multus-cni/master/deployments/multus-daemonset-thick.yml &>/dev/null
        
        exit 0
    fi

    # Increase total expected time
    TOTAL_WAITED=$((TOTAL_WAITED + WAIT_INTERVAL))

    # Wait before next check
    sleep "$WAIT_INTERVAL"
done

# If the pod is not in 'Running' state after 3 minutes, exit with exit code 1
echo "The pod is not in Running state after 3 minutes."
exit 1
