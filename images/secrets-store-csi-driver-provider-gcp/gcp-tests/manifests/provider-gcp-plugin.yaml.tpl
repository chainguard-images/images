# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: secrets-store-csi-driver-provider-gcp
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: secrets-store-csi-driver-provider-gcp-rolebinding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: secrets-store-csi-driver-provider-gcp-role
subjects:
  - kind: ServiceAccount
    name: secrets-store-csi-driver-provider-gcp
    namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: secrets-store-csi-driver-provider-gcp-role
rules:
  - apiGroups:
      - ""
    resources:
      - serviceaccounts/token
    verbs:
      - create
  - apiGroups:
      - ""
    resources:
      - serviceaccounts
    verbs:
      - get
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  labels:
    app: csi-secrets-store-provider-gcp
  name: csi-secrets-store-provider-gcp
  namespace: kube-system
spec:
  updateStrategy:
    type: RollingUpdate
  selector:
    matchLabels:
      app: csi-secrets-store-provider-gcp
  template:
    metadata:
      labels:
        app: csi-secrets-store-provider-gcp
    spec:
      serviceAccountName: secrets-store-csi-driver-provider-gcp
      containers:
        - name: provider
          image: ${gcp_provider_image}
          imagePullPolicy: IfNotPresent
          resources:
            requests:
              cpu: 50m
              memory: 100Mi
            limits:
              cpu: 50m
              memory: 100Mi
          env:
            - name: TARGET_DIR
              value: "/etc/kubernetes/secrets-store-csi-providers"
          volumeMounts:
            - mountPath: "/etc/kubernetes/secrets-store-csi-providers"
              name: providervol
          livenessProbe:
            failureThreshold: 3
            httpGet:
              path: /live
              port: 8095
            initialDelaySeconds: 5
            timeoutSeconds: 10
            periodSeconds: 30
      volumes:
        - name: providervol
          hostPath:
            path: /etc/kubernetes/secrets-store-csi-providers
      nodeSelector:
        kubernetes.io/os: linux
