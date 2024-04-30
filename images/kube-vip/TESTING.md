# Local testing using k3d cluster

Test steps to deploy a local instance of kube-vip in a k3d cluster. Note some
steps where referred to in the [upstream docs](https://kube-vip.io/docs/usage/kind),
but some additions where needed to work around some permission issues.

## Step 1: Permissions

```bash
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
```

## Step 2: Get free IP address

kube-vip requires an unused IP address. Start by checking: 

```bash
kubectl get nodes -o wide
```

Take note of `INTERNAL-IP`, and find another un-used IP address in the same
range.

## Step 3: Deploy!

```bash
alias kube-vip="docker run --network host --rm cgr.dev/chainguard/kube-vip:latest"
kube-vip manifest daemonset \
    --interface eth0 \
    --vip UPDATE-ME-UNUSED-IP-FROM-STEP-2 \
    --inCluster \
    --arp \
    --leaderElection \
    --services \
    --controlplane | kubectl apply -f -
```

## Step 4: Log validation

kube-vip should be running successfully, without any errors in the logs:

```bash
k logs kube-vip-ds-s5vtm -n kube-system
time="2024-04-30T15:28:05Z" level=info msg="Starting kube-vip.io [v0.8.0]"
time="2024-04-30T15:28:05Z" level=info msg="namespace [kube-system], Mode: [ARP], Features(s): Control Plane:[true], Services:[true]"
time="2024-04-30T15:28:05Z" level=info msg="Using node name [k3d-k3s-default-server-0]"
time="2024-04-30T15:28:05Z" level=info msg="prometheus HTTP server started"
time="2024-04-30T15:28:05Z" level=info msg="Starting Kube-vip Manager with the ARP engine"
time="2024-04-30T15:28:05Z" level=info msg="beginning services leadership, namespace [kube-system], lock name [plndr-svcs-lock], id [k3d-k3s-default-server-0]"
I0430 15:28:05.403166       1 leaderelection.go:250] attempting to acquire leader lease kube-system/plndr-svcs-lock...
time="2024-04-30T15:28:05Z" level=info msg="Beginning cluster membership, namespace [kube-system], lock name [plndr-cp-lock], id [k3d-k3s-default-server-0]"
I0430 15:28:05.403546       1 leaderelection.go:250] attempting to acquire leader lease kube-system/plndr-cp-lock...
I0430 15:28:05.409387       1 leaderelection.go:260] successfully acquired lease kube-system/plndr-cp-lock
time="2024-04-30T15:28:05Z" level=info msg="Node [k3d-k3s-default-server-0] is assuming leadership of the cluster"
time="2024-04-30T15:28:05Z" level=info msg="(svcs) starting services watcher for all namespaces"
time="2024-04-30T15:28:05Z" level=info msg="Gratuitous Arp broadcast will repeat every 3 seconds for [192.168.208.195/eth0]"
time="2024-04-30T15:28:05Z" level=info msg="(svcs) adding VIP [192.168.208.3] via eth0 for [kube-system/traefik]"
```

## Step 5: Test!

Following example in [upstream docs](https://kube-vip.io/docs/usage/kind),
create a new nginx deployment:

```bash
kubectl apply -f https://k8s.io/examples/application/deployment.yaml
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer --name=nginx
```

The nginx svc should have been assigned an external IP:

```bash
kubectl get svc
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
kubernetes   ClusterIP      10.96.0.1       <none>          443/TCP        74m
nginx        LoadBalancer   10.96.196.235   172.18.100.11   80:31236/TCP   6s
```