#!/bin/bash

# Set up error handling and debug output
set -o errexit -o nounset -o pipefail -x

namespace="kube-system-${RANDOM}"

# Create a namespace for kube-vip
kubectl create namespace "$namespace"

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

# Get the IP address and remove whitespace
NODE_IP=$(kubectl get nodes -o wide | awk '/k3d-k3s-default-server-0/ {print $6}' | tr -d '[:space:]')

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
docker run --network host --rm $IMAGE_NAME manifest daemonset \
    --interface eth0 \
    --vip $NEW_IP_ADDRESS1 \
    --inCluster \
    --taint \
    --arp \
    --leaderElection \
    --services \
    --controlplane | tee kube-vip.yaml

awk '{gsub("kube-system","'"$namespace"'")}1' kube-vip.yaml > temp && mv temp kube-vip.yaml

kubectl apply -f kube-vip.yaml

# Set the image (assuming there's a known bug with the original command)
kubectl set image -n $namespace daemonset/kube-vip-ds kube-vip="$IMAGE_NAME"

# Wait for the kube-vip daemonset to be ready
kubectl rollout status -n $namespace daemonset/kube-vip-ds --timeout=5m

# Check if the kube-vip daemonset is ready
POD_NAME=$(kubectl get pods -n $namespace -l app.kubernetes.io/name=kube-vip-ds -ojsonpath='{.items[*].metadata.name}')

kubectl logs -n $namespace $POD_NAME | grep -i "Starting Kube-vip Manager with the ARP engine"

# Create a deployment and expose it as a service
kubectl apply -f https://k8s.io/examples/application/deployment.yaml
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer --name=nginx

# Annotate the nginx service for kube-vip management
kubectl annotate service nginx kube-vip.io/loadbalancerIPs="$NEW_IP_ADDRESS2"

# Check if IP was assigned as the external IP
max_retries=15
retry_interval=10

for ((i = 0; i < max_retries; i++)); do
    actual_external_ip=$(kubectl get svc nginx -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    annotated_ip=$(kubectl get svc nginx -o jsonpath='{.metadata.annotations.kube-vip\.io/loadbalancerIPs}')

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
