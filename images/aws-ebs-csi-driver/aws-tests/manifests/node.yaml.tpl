---
# Source: aws-ebs-csi-driver/templates/node.yaml
# Node Service
kind: DaemonSet
apiVersion: apps/v1
metadata:
  name: ebs-csi-node
  labels:
    app.kubernetes.io/name: aws-ebs-csi-driver
spec:
  selector:
    matchLabels:
      app: ebs-csi-node
      app.kubernetes.io/name: aws-ebs-csi-driver
  updateStrategy:
    rollingUpdate:
      maxUnavailable: 10%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: ebs-csi-node
        app.kubernetes.io/name: aws-ebs-csi-driver
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: eks.amazonaws.com/compute-type
                operator: NotIn
                values:
                - fargate
      nodeSelector:
        kubernetes.io/os: linux
      serviceAccountName: ebs-csi-node-sa
      priorityClassName: system-node-critical
      tolerations:
        - operator: Exists
      securityContext:
        fsGroup: 0
        runAsGroup: 0
        runAsNonRoot: false
        runAsUser: 0
      containers:
        - name: ebs-plugin
          image: ${ebs_csi_driver_image}
          imagePullPolicy: IfNotPresent
          args:
            - node
            - --endpoint=$(CSI_ENDPOINT)
            - --logging-format=text
            - --v=2
          env:
            - name: CSI_ENDPOINT
              value: unix:/csi/csi.sock
            - name: CSI_NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: spec.nodeName
          volumeMounts:
            - name: kubelet-dir
              mountPath: /var/lib/kubelet
              mountPropagation: "Bidirectional"
            - name: plugin-dir
              mountPath: /csi
            - name: device-dir
              mountPath: /dev
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
          resources:
            limits:
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 40Mi
          securityContext:
            privileged: true
            readOnlyRootFilesystem: true
        - name: node-driver-registrar
          image: public.ecr.aws/eks-distro/kubernetes-csi/node-driver-registrar:v2.8.0-eks-1-27-3
          imagePullPolicy: IfNotPresent
          args:
            - --csi-address=$(ADDRESS)
            - --kubelet-registration-path=$(DRIVER_REG_SOCK_PATH)
            - --v=2
          env:
            - name: ADDRESS
              value: /csi/csi.sock
            - name: DRIVER_REG_SOCK_PATH
              value: /var/lib/kubelet/plugins/ebs.csi.aws.com/csi.sock
          livenessProbe:
            exec:
              command:
                - /csi-node-driver-registrar
                - --kubelet-registration-path=$(DRIVER_REG_SOCK_PATH)
                - --mode=kubelet-registration-probe
            initialDelaySeconds: 30
            timeoutSeconds: 15
            periodSeconds: 90
          volumeMounts:
            - name: plugin-dir
              mountPath: /csi
            - name: registration-dir
              mountPath: /registration
            - name: probe-dir
              mountPath: /var/lib/kubelet/plugins/ebs.csi.aws.com/
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
            - name: plugin-dir
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
        - name: kubelet-dir
          hostPath:
            path: /var/lib/kubelet
            type: Directory
        - name: plugin-dir
          hostPath:
            path: /var/lib/kubelet/plugins/ebs.csi.aws.com/
            type: DirectoryOrCreate
        - name: registration-dir
          hostPath:
            path: /var/lib/kubelet/plugins_registry/
            type: Directory
        - name: device-dir
          hostPath:
            path: /dev
            type: Directory
        - name: probe-dir
          emptyDir: {}
