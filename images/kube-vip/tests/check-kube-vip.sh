#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl apply -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: kube-vip
  namespace: kube-system
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
  namespace: kube-system
EOF

kubectl get nodes -o wide

# Get the IP address and remove whitespace
NODE_IP=$(kubectl get nodes -o wide | awk '/k3d-k3s-default-server-0/ {print $6}' | tr -d '[:space:]')

# Split the IP address into an array
IFS='.' read -r ip1 ip2 ip3 ip4 <<< "$NODE_IP"

# Add 50 to the last octet
last_octet=$((ip4 + 10))

# Handle the case where the last octet exceeds 255
if [ $last_octet -gt 255 ]; then
  echo "Error: IP address increment leads to an invalid address"
  exit 1
fi

# Reassemble the IP address
NEW_IP_ADDRESS="${ip1}.${ip2}.${ip3}.$last_octet"
echo $NEW_IP_ADDRESS

docker run --network host --rm $IMAGE_NAME manifest daemonset \
    --interface eth0 \
    --vip $NEW_IP_ADDRESS \
    --inCluster \
    --taint \
    --arp \
    --leaderElection \
    --services \
    --controlplane | kubectl apply -f -

# set the image
# there is a bug in the kube-vip command
kubectl set image -n kube-system daemonset/kube-vip-ds kube-vip="$IMAGE_NAME"

# Wait for the kube-vip daemonset to be ready
kubectl rollout status -n kube-system daemonset/kube-vip-ds --timeout=5m

# Check if the kube-vip daemonset is ready
kubectl logs -n kube-system -l app.kubernetes.io/name=kube-vip-ds | grep -q "Starting Kube-vip Manager with the ARP engine"