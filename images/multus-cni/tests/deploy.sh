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
cat <<EOF > multus-values.yaml
# Note:
#   This deployment file is designed for 'quickstart' of multus, easy installation to test it,
#   hence this deployment yaml does not care about following things intentionally.
#     - various configuration options
#     - minor deployment scenario
#     - upgrade/update/uninstall scenario
#   Multus team understand users deployment scenarios are diverse, hence we do not cover
#   comprehensive deployment scenario. We expect that it is covered by each platform deployment.
---
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: network-attachment-definitions.k8s.cni.cncf.io
spec:
  group: k8s.cni.cncf.io
  scope: Namespaced
  names:
    plural: network-attachment-definitions
    singular: network-attachment-definition
    kind: NetworkAttachmentDefinition
    shortNames:
      - net-attach-def
  versions:
    - name: v1
      served: true
      storage: true
      schema:
        openAPIV3Schema:
          description: 'NetworkAttachmentDefinition is a CRD schema specified by the Network Plumbing
            Working Group to express the intent for attaching pods to one or more logical or physical
            networks. More information available at: https://github.com/k8snetworkplumbingwg/multi-net-spec'
          type: object
          properties:
            apiVersion:
              description: 'APIVersion defines the versioned schema of this represen
                tation of an object. Servers should convert recognized schemas to the
                latest internal value, and may reject unrecognized values. More info:
                https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources'
              type: string
            kind:
              description: 'Kind is a string value representing the REST resource this
                object represents. Servers may infer this from the endpoint the client
                submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds'
              type: string
            metadata:
              type: object
            spec:
              description: 'NetworkAttachmentDefinition spec defines the desired state of a network attachment'
              type: object
              properties:
                config:
                  description: 'NetworkAttachmentDefinition config is a JSON-formatted CNI configuration'
                  type: string
---
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: multus
rules:
  - apiGroups: ["k8s.cni.cncf.io"]
    resources:
      - '*'
    verbs:
      - '*'
  - apiGroups:
      - ""
    resources:
      - pods
      - pods/status
    verbs:
      - get
      - list
      - update
      - watch
  - apiGroups:
      - ""
      - events.k8s.io
    resources:
      - events
    verbs:
      - create
      - patch
      - update
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: multus
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: multus
subjects:
  - kind: ServiceAccount
    name: multus
    namespace: kube-system
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: multus
  namespace: kube-system
---
kind: ConfigMap
apiVersion: v1
metadata:
  name: multus-daemon-config
  namespace: kube-system
  labels:
    tier: node
    app: multus
data:
  daemon-config.json: |
    {
        "chrootDir": "/hostroot",
        "cniVersion": "0.3.1",
        "logLevel": "verbose",
        "logToStderr": true,
        "cniConfigDir": "/host/etc/cni/net.d",
        "multusAutoconfigDir": "/host/etc/cni/net.d",
        "multusConfigFile": "auto",
        "socketDir": "/host/run/multus/"
    }
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: kube-multus-ds
  namespace: kube-system
  labels:
    tier: node
    app: multus
    name: multus
spec:
  selector:
    matchLabels:
      name: multus
  updateStrategy:
    type: RollingUpdate
  template:
    metadata:
      labels:
        tier: node
        app: multus
        name: multus
    spec:
      hostNetwork: true
      hostPID: true
      tolerations:
        - operator: Exists
          effect: NoSchedule
        - operator: Exists
          effect: NoExecute
      serviceAccountName: multus
      containers:
        - name: kube-multus
          image: ${IMAGE_NAME}
          command: [ "/usr/src/multus-cni/bin/multus-daemon" ]
          resources:
            requests:
              cpu: "100m"
              memory: "50Mi"
            limits:
              cpu: "100m"
              memory: "50Mi"
          securityContext:
            privileged: true
          volumeMounts:
            - name: cni
              mountPath: /host/etc/cni/net.d
            # multus-daemon expects that cnibin path must be identical between pod and container host.
            # e.g. if the cni bin is in '/opt/cni/bin' on the container host side, then it should be mount to '/opt/cni/bin' in multus-daemon,
            # not to any other directory, like '/opt/bin' or '/usr/bin'.
            - name: cnibin
              mountPath: /opt/cni/bin
            - name: host-run
              mountPath: /host/run
            - name: host-var-lib-cni-multus
              mountPath: /var/lib/cni/multus
            - name: host-var-lib-kubelet
              mountPath: /var/lib/kubelet
            - name: host-run-k8s-cni-cncf-io
              mountPath: /run/k8s.cni.cncf.io
            - name: host-run-netns
              mountPath: /run/netns
              mountPropagation: HostToContainer
            - name: multus-daemon-config
              mountPath: /etc/cni/net.d/multus.d
              readOnly: true
            - name: hostroot
              mountPath: /hostroot
              mountPropagation: HostToContainer
          env:
            - name: MULTUS_NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: spec.nodeName
      initContainers:
        - name: install-multus-binary
          image: ${IMAGE_NAME}
          command:
            - "cp"
            - "/usr/src/multus-cni/bin/multus-shim"
            - "/host/opt/cni/bin/multus-shim"
          resources:
            requests:
              cpu: "10m"
              memory: "15Mi"
          securityContext:
            privileged: true
          volumeMounts:
            - name: cnibin
              mountPath: /host/opt/cni/bin
              mountPropagation: Bidirectional
      terminationGracePeriodSeconds: 10
      volumes:
        - name: cni
          hostPath:
            path: /etc/cni/net.d
        - name: cnibin
          hostPath:
            path: /opt/cni/bin
        - name: hostroot
          hostPath:
            path: /
        - name: multus-daemon-config
          configMap:
            name: multus-daemon-config
            items:
            - key: daemon-config.json
              path: daemon-config.json
        - name: host-run
          hostPath:
            path: /run
        - name: host-var-lib-cni-multus
          hostPath:
            path: /var/lib/cni/multus
        - name: host-var-lib-kubelet
          hostPath:
            path: /var/lib/kubelet
        - name: host-run-k8s-cni-cncf-io
          hostPath:
            path: /run/k8s.cni.cncf.io
        - name: host-run-netns
          hostPath:
            path: /run/netns/
EOF
kubectl apply -f multus-values.yml  &>/dev/null

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
    image: $IMAGE_NAME
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
