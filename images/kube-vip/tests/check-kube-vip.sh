#!/bin/bash

# Set up error handling and debug output
set -o errexit -o nounset -o pipefail -x

get_nodes() {
  max_attempts=5
  sleep_duration=10  # in seconds
  attempt=0
  while [ $attempt -lt $max_attempts ]; do
    # Get nodes and capture the output
    output=$(kubectl get nodes)
    # Check if any resources are retrieved
    if echo "$output" | grep -q 'NAME'; then
      echo "Successfully retrieved nodes."
      echo "$output"
      return 0
    else
      echo "Attempt $((attempt + 1)) failed. No nodes retrieved."
    fi
    attempt=$((attempt + 1))
    sleep $sleep_duration
  done
  echo "Max attempts reached. Could not get nodes."
  return 1
}

namespace="kube-system"

IMAGE_NAME="$IMAGE_REGISTRY/$IMAGE_REPOSITORY:$IMAGE_TAG"

# Apply the necessary RBAC settings for kube-vip
kubectl apply -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: kube-vip
  namespace: $namespace
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  annotations:
    rbac.authorization.kubernetes.io/autoupdate: "true"
  name: system:kube-vip-role
rules:
  - apiGroups: [""]
    resources: ["services/status"]
    verbs: ["update"]
  - apiGroups: [""]
    resources: ["services", "endpoints"]
    verbs: ["list", "get", "watch", "update"]
  - apiGroups: [""]
    resources: ["nodes"]
    verbs: ["list", "get", "watch", "update", "patch"]
  - apiGroups: ["coordination.k8s.io"]
    resources: ["leases"]
    verbs: ["list", "get", "watch", "create", "update"]
  - apiGroups: ["discovery.k8s.io"]
    resources: ["endpointslices"]
    verbs: ["list", "get", "watch", "update"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: system:kube-vip-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: system:kube-vip-role
subjects:
- kind: ServiceAccount
  name: kube-vip
  namespace: $namespace
EOF

get_nodes
# Get the IP address and remove whitespace
NODE_IP=$(kubectl get nodes -o wide --no-headers | awk '{print $6}' | tr -d '[:space:]')

# Split the IP address into an array
IFS='.' read -r ip1 ip2 ip3 ip4 <<< "$NODE_IP"

# Calculate the new IP addresses
last_octet_first_ip=$((ip4 + 10))
last_octet_second_ip=$((ip4 + 20)) # Additional 10 for the second IP

# Handle the case where the last octets exceed 255
if [ $last_octet_first_ip -gt 255 ] || [ $last_octet_second_ip -gt 255 ]; then
  echo "Error: IP address increment leads to an invalid address"
  exit 1
fi

# Reassemble the IP addresses
NEW_IP_ADDRESS1="${ip1}.${ip2}.${ip3}.$last_octet_first_ip"
NEW_IP_ADDRESS2="${ip1}.${ip2}.${ip3}.$last_octet_second_ip"
echo "First new IP: $NEW_IP_ADDRESS1"
echo "Second new IP: $NEW_IP_ADDRESS2"

# Run kube-vip as a docker container and apply its manifest
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: DaemonSet
metadata:
  creationTimestamp: null
  labels:
    app.kubernetes.io/name: kube-vip-ds
    app.kubernetes.io/version: 0.8.0
  name: kube-vip-ds
  namespace: $namespace
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: kube-vip-ds
  template:
    metadata:
      creationTimestamp: null
      labels:
        app.kubernetes.io/name: kube-vip-ds
        app.kubernetes.io/version: 0.8.0
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/master
                operator: Exists
            - matchExpressions:
              - key: node-role.kubernetes.io/control-plane
                operator: Exists
      containers:
      - args:
        - manager
        env:
        - name: vip_arp
          value: "true"
        - name: port
          value: "6443"
        - name: vip_nodename
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
        - name: vip_interface
          value: eth0
        - name: vip_cidr
          value: "32"
        - name: dns_mode
          value: first
        - name: cp_enable
          value: "true"
        - name: cp_namespace
          value: kube-system
        - name: svc_enable
          value: "true"
        - name: svc_leasename
          value: plndr-svcs-lock
        - name: vip_leaderelection
          value: "true"
        - name: vip_leasename
          value: plndr-cp-lock
        - name: vip_leaseduration
          value: "5"
        - name: vip_renewdeadline
          value: "3"
        - name: vip_retryperiod
          value: "1"
        - name: vip_address
          value: 172.18.0.12
        - name: prometheus_server
          value: :2112
        image: ghcr.io/kube-vip/kube-vip:0.8.0
        imagePullPolicy: IfNotPresent
        name: kube-vip
        resources: {}
        securityContext:
          capabilities:
            add:
            - NET_ADMIN
            - NET_RAW
      hostNetwork: true
      serviceAccountName: kube-vip
      tolerations:
      - effect: NoSchedule
        operator: Exists
      - effect: NoExecute
        operator: Exists
  updateStrategy: {}
EOF

# Set the image (assuming there's a known bug with the original command)
kubectl set image -n $namespace daemonset/kube-vip-ds kube-vip="$IMAGE_NAME"

# Wait for the kube-vip daemonset to be ready
kubectl rollout status -n $namespace daemonset/kube-vip-ds --timeout=5m

# Check if the kube-vip daemonset is ready
POD_NAME=$(kubectl get pods -n $namespace -l app.kubernetes.io/name=kube-vip-ds -ojsonpath='{.items[*].metadata.name}')

kubectl logs -n $namespace $POD_NAME | grep -i "Starting Kube-vip Manager with the ARP engine"

# Create a deployment and expose it as a service
kubectl apply -f https://k8s.io/examples/application/deployment.yaml -n $namespace
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer --name=nginx -n $namespace

# Annotate the nginx service for kube-vip management
kubectl annotate service nginx kube-vip.io/loadbalancerIPs="$NEW_IP_ADDRESS2" -n $namespace

# Check if IP was assigned as the external IP
max_retries=15
retry_interval=10

for ((i = 0; i < max_retries; i++)); do
    actual_external_ip=$(kubectl get svc nginx -n $namespace -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    annotated_ip=$(kubectl get svc -n $namespace  nginx -o jsonpath='{.metadata.annotations.kube-vip\.io/loadbalancerIPs}')

    if [[ -n "$actual_external_ip" && "$actual_external_ip" == "$annotated_ip" ]]; then
        echo "Success: The annotated IP matches the actual external IP."
        break
    elif [[ i -eq $((max_retries - 1)) ]]; then
        echo "Error: Reached maximum retry attempts without success."
        exit 1
    else
        echo "Attempt $((i + 1)): External IP not ready or does not match. Retrying in $retry_interval seconds..."
        sleep $retry_interval
    fi
done

echo "Test completed successfully."