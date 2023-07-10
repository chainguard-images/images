---
# Source: aws-ebs-csi-driver/templates/controller.yaml
# Controller Service
kind: Deployment
apiVersion: apps/v1
metadata:
  name: ebs-csi-controller
  labels:
    app.kubernetes.io/name: aws-ebs-csi-driver
spec:
  replicas: 2
  strategy:
    rollingUpdate:
      maxUnavailable: 1
    type: RollingUpdate
  selector:
    matchLabels:
      app: ebs-csi-controller
      app.kubernetes.io/name: aws-ebs-csi-driver
  template:
    metadata:
      labels:
        app: ebs-csi-controller
        app.kubernetes.io/name: aws-ebs-csi-driver
    spec:
      nodeSelector:
        kubernetes.io/os: linux
      serviceAccountName: ebs-csi-controller-sa
      priorityClassName: system-cluster-critical
      affinity:
        nodeAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
          - preference:
              matchExpressions:
              - key: eks.amazonaws.com/compute-type
                operator: NotIn
                values:
                - fargate
            weight: 1
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
          - podAffinityTerm:
              labelSelector:
                matchExpressions:
                - key: app
                  operator: In
                  values:
                  - ebs-csi-controller
              topologyKey: kubernetes.io/hostname
            weight: 100
      tolerations:
        - key: CriticalAddonsOnly
          operator: Exists
        - effect: NoExecute
          operator: Exists
          tolerationSeconds: 300
      securityContext:
        fsGroup: 1000
        runAsGroup: 1000
        runAsNonRoot: true
        runAsUser: 1000
      containers:
        - name: ebs-plugin
          image: ${ebs_csi_driver_image}
          imagePullPolicy: IfNotPresent
          args:
            # - {all,controller,node} # specify the driver mode
            - --endpoint=$(CSI_ENDPOINT)
            - --logging-format=text
            - --user-agent-extra=kustomize
            - --v=2
          env:
            - name: CSI_ENDPOINT
              value: unix:///var/lib/csi/sockets/pluginproxy/csi.sock
            - name: CSI_NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: spec.nodeName
            - name: AWS_ACCESS_KEY_ID
              valueFrom:
                secretKeyRef:
                  name: aws-secret
                  key: key_id
                  optional: true
            - name: AWS_SECRET_ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: aws-secret
                  key: access_key
                  optional: true
            - name: AWS_EC2_ENDPOINT
              valueFrom:
                configMapKeyRef:
                  name: aws-meta
                  key: endpoint
                  optional: true
          volumeMounts:
            - name: socket-dir
              mountPath: /var/lib/csi/sockets/pluginproxy/
          ports:
            - name: healthz
              containerPort: 9808
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /healthz
              port: healthz
            initialDelaySeconds: 10
            timeoutSeconds: 3
            periodSeconds: 10
            failureThreshold: 5
          readinessProbe:
            httpGet:
              path: /healthz
              port: healthz
            initialDelaySeconds: 10
            timeoutSeconds: 3
            periodSeconds: 10
            failureThreshold: 5
          resources:
            limits:
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 40Mi
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
        - name: csi-provisioner
          image: public.ecr.aws/eks-distro/kubernetes-csi/external-provisioner:v3.5.0-eks-1-27-3
          imagePullPolicy: IfNotPresent
          args:
            - --csi-address=$(ADDRESS)
            - --v=2
            - --feature-gates=Topology=true
            - --extra-create-metadata
            - --leader-election=true
            - --default-fstype=ext4
          env:
            - name: ADDRESS
              value: /var/lib/csi/sockets/pluginproxy/csi.sock
          volumeMounts:
            - name: socket-dir
              mountPath: /var/lib/csi/sockets/pluginproxy/
          resources:
            limits:
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 40Mi
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
        - name: csi-attacher
          image: public.ecr.aws/eks-distro/kubernetes-csi/external-attacher:v4.3.0-eks-1-27-3
          imagePullPolicy: IfNotPresent
          args:
            - --csi-address=$(ADDRESS)
            - --v=2
            - --leader-election=true
          env:
            - name: ADDRESS
              value: /var/lib/csi/sockets/pluginproxy/csi.sock
          volumeMounts:
            - name: socket-dir
              mountPath: /var/lib/csi/sockets/pluginproxy/
          resources:
            limits:
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 40Mi
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
        - name: csi-snapshotter
          image: public.ecr.aws/eks-distro/kubernetes-csi/external-snapshotter/csi-snapshotter:v6.2.1-eks-1-27-3
          imagePullPolicy: IfNotPresent
          args:
            - --csi-address=$(ADDRESS)
            - --leader-election=true
            - --extra-create-metadata
          env:
            - name: ADDRESS
              value: /var/lib/csi/sockets/pluginproxy/csi.sock
          volumeMounts:
            - name: socket-dir
              mountPath: /var/lib/csi/sockets/pluginproxy/
          resources:
            limits:
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 40Mi
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
        - name: csi-resizer
          image: public.ecr.aws/eks-distro/kubernetes-csi/external-resizer:v1.8.0-eks-1-27-3
          imagePullPolicy: IfNotPresent
          args:
            - --csi-address=$(ADDRESS)
            - --v=2
            - --handle-volume-inuse-error=false
            - --leader-election=true
          env:
            - name: ADDRESS
              value: /var/lib/csi/sockets/pluginproxy/csi.sock
          volumeMounts:
            - name: socket-dir
              mountPath: /var/lib/csi/sockets/pluginproxy/
          resources:
            limits:
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 40Mi
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
        - name: liveness-probe
          image: public.ecr.aws/eks-distro/kubernetes-csi/livenessprobe:v2.10.0-eks-1-27-3
          imagePullPolicy: IfNotPresent
          args:
            - --csi-address=/csi/csi.sock
          volumeMounts:
            - name: socket-dir
              mountPath: /csi
          resources:
            limits:
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 40Mi
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: true
      volumes:
        - name: socket-dir
          emptyDir: {}
