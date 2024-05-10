#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
NAMESPACE="keycloak-test"

function cleanup() {
    echo "Starting cleanup process..."

    # Log the Keycloak Operator's output before cleanup
    echo "Gathering logs from Keycloak Operator..."
    kubectl logs -l app.kubernetes.io/name=keycloak-operator -n ${NAMESPACE}

    # Delete the Keycloak custom resource
    echo "Deleting Keycloak custom resource..."
    kubectl delete keycloak --all -n ${NAMESPACE} || true

    # Delete the PostgreSQL StatefulSet and service
    echo "Deleting PostgreSQL database resources..."
    kubectl delete statefulset postgresql-db -n ${NAMESPACE} || true
    kubectl delete service postgres-db -n ${NAMESPACE} || true

    # Delete the Keycloak operator deployment and associated resources
    echo "Deleting Keycloak operator deployment and associated resources..."
    kubectl delete -f "${TMPDIR}/minimal-keycloak-operator-manifest.yaml" -n ${NAMESPACE} || true

    # Delete secrets created during setup
    echo "Deleting created secrets..."
    kubectl delete secret example-tls-secret -n ${NAMESPACE} || true
    kubectl delete secret keycloak-db-secret -n ${NAMESPACE} || true

    # Optionally, clean up the Keycloak Operator Custom Resource Definitions (CRDs)
    echo "Deleting Keycloak Operator CRDs..."
    kubectl delete -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/24.0.4/kubernetes/keycloaks.k8s.keycloak.org-v1.yml || true
    kubectl delete -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/24.0.4/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml || true

    # Delete the namespace (only if you are sure it should be removed)
    echo "Deleting namespace..."
    kubectl delete ns ${NAMESPACE} --wait=false

    # Remove the temporary directory
    echo "Removing temporary directory..."
    rm -rf "$TMPDIR"

    echo "Cleanup process completed."
}

# Attach the cleanup function to the EXIT trap
trap cleanup EXIT


# Create Namespace and CRDs
kubectl create ns $NAMESPACE 
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/24.0.4/kubernetes/keycloaks.k8s.keycloak.org-v1.yml
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/24.0.4/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml

# Apply the keycloak-operator manifest
cat <<EOF > "${TMPDIR}/minimal-keycloak-operator-manifest.yaml"
---
apiVersion: v1
kind: ServiceAccount
metadata:
  annotations:
    app.quarkus.io/quarkus-version: 3.8.3
    app.quarkus.io/vcs-uri: https://github.com/keycloak/keycloak.git
    app.quarkus.io/build-timestamp: 2024-05-07 - 12:29:12 +0000
  labels:
    app.kubernetes.io/name: keycloak-operator
    app.kubernetes.io/version: 24.0.3
    app.kubernetes.io/managed-by: quarkus
  name: keycloak-operator
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: keycloak-operator-clusterrole
rules:
  - apiGroups:
      - config.openshift.io
    resources:
      - ingresses
    verbs:
      - get
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: keycloakrealmimportcontroller-cluster-role
rules:
  - apiGroups:
      - k8s.keycloak.org
    resources:
      - keycloakrealmimports
      - keycloakrealmimports/status
      - keycloakrealmimports/finalizers
    verbs:
      - get
      - list
      - watch
      - patch
      - update
      - create
      - delete
  - apiGroups:
      - ""
    resources:
      - secrets
    verbs:
      - get
      - list
      - watch
      - patch
      - update
      - delete
      - create
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: keycloakcontroller-cluster-role
rules:
  - apiGroups:
      - k8s.keycloak.org
    resources:
      - keycloaks
      - keycloaks/status
      - keycloaks/finalizers
    verbs:
      - get
      - list
      - watch
      - patch
      - update
      - create
      - delete
  - apiGroups:
      - ""
    resources:
      - services
    verbs:
      - get
      - list
      - watch
      - patch
      - update
      - delete
      - create
  - apiGroups:
      - apps
    resources:
      - statefulsets
    verbs:
      - get
      - list
      - watch
      - patch
      - update
      - delete
      - create
  - apiGroups:
      - ""
    resources:
      - services
    verbs:
      - get
      - list
      - watch
      - patch
      - update
      - delete
      - create
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingresses
    verbs:
      - get
      - list
      - watch
      - patch
      - update
      - delete
      - create
  - apiGroups:
      - ""
    resources:
      - secrets
    verbs:
      - get
      - list
      - watch
      - delete
      - create
      - patch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    app.kubernetes.io/name: keycloak-operator
  name: keycloak-operator-clusterrole-binding
roleRef:
  kind: ClusterRole
  apiGroup: rbac.authorization.k8s.io
  name: keycloak-operator-clusterrole
subjects:
  - kind: ServiceAccount
    name: keycloak-operator
    namespace: keycloak
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: keycloak-operator-role
rules:
  - apiGroups:
      - apps
    resources:
      - statefulsets
    verbs:
      - get
      - list
      - watch
      - create
      - delete
      - patch
      - update
  - apiGroups:
      - ""
    resources:
      - configmaps
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - ""
    resources:
      - secrets
      - services
    verbs:
      - get
      - list
      - watch
      - create
      - delete
      - patch
      - update
  - apiGroups:
      - ""
    resources:
      - pods
    verbs:
      - list
  - apiGroups:
      - batch
    resources:
      - jobs
    verbs:
      - get
      - list
      - watch
      - create
      - delete
      - patch
      - update
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingresses
    verbs:
      - get
      - list
      - watch
      - create
      - delete
      - patch
      - update
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  labels:
    app.kubernetes.io/name: keycloak-operator
  name: keycloak-operator-role-binding
roleRef:
  kind: Role
  apiGroup: rbac.authorization.k8s.io
  name: keycloak-operator-role
subjects:
  - kind: ServiceAccount
    name: keycloak-operator
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: keycloakrealmimportcontroller-role-binding
roleRef:
  kind: ClusterRole
  apiGroup: rbac.authorization.k8s.io
  name: keycloakrealmimportcontroller-cluster-role
subjects:
  - kind: ServiceAccount
    name: keycloak-operator
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: keycloakcontroller-role-binding
roleRef:
  kind: ClusterRole
  apiGroup: rbac.authorization.k8s.io
  name: keycloakcontroller-cluster-role
subjects:
  - kind: ServiceAccount
    name: keycloak-operator
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  labels:
    app.kubernetes.io/name: keycloak-operator
    app.kubernetes.io/version: 24.0.3
  name: keycloak-operator-view
roleRef:
  kind: ClusterRole
  apiGroup: rbac.authorization.k8s.io
  name: view
subjects:
  - kind: ServiceAccount
    name: keycloak-operator
---
apiVersion: v1
kind: Service
metadata:
  annotations:
    app.quarkus.io/quarkus-version: 3.8.3
    app.quarkus.io/vcs-uri: https://github.com/keycloak/keycloak.git
    app.quarkus.io/build-timestamp: 2024-05-07 - 12:29:12 +0000
  labels:
    app.kubernetes.io/name: keycloak-operator
    app.kubernetes.io/version: 24.0.3
    app.kubernetes.io/managed-by: quarkus
  name: keycloak-operator
spec:
  ports:
    - name: http
      port: 80
      protocol: TCP
      targetPort: 8080
  selector:
    app.kubernetes.io/name: keycloak-operator
  type: ClusterIP
---
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    app.quarkus.io/quarkus-version: 3.8.3
    app.quarkus.io/vcs-uri: https://github.com/keycloak/keycloak.git
    app.quarkus.io/build-timestamp: 2024-05-07 - 12:29:12 +0000
  labels:
    app.kubernetes.io/name: keycloak-operator
    app.kubernetes.io/version: 24.0.3
    app.kubernetes.io/managed-by: quarkus
  name: keycloak-operator
spec:
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/name: keycloak-operator
  template:
    metadata:
      annotations:
        app.quarkus.io/quarkus-version: 3.8.3
        app.quarkus.io/vcs-uri: https://github.com/keycloak/keycloak.git
        app.quarkus.io/build-timestamp: 2024-05-07 - 12:29:12 +0000
      labels:
        app.kubernetes.io/managed-by: quarkus
        app.kubernetes.io/version: 24.0.3
        app.kubernetes.io/name: keycloak-operator
    spec:
      containers:
        - env:
            - name: KUBERNETES_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: RELATED_IMAGE_KEYCLOAK
              value: cgr.dev/chainguard/keycloak:latest
          image: ${IMAGE_NAME}
          imagePullPolicy: Always
          livenessProbe:
            failureThreshold: 3
            httpGet:
              path: /q/health/live
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 5
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 10
          name: keycloak-operator
          ports:
            - containerPort: 8080
              name: http
              protocol: TCP
          readinessProbe:
            failureThreshold: 3
            httpGet:
              path: /q/health/ready
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 5
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 10
          startupProbe:
            failureThreshold: 3
            httpGet:
              path: /q/health/started
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 5
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 10
      serviceAccountName: keycloak-operator
EOF
kubectl create -f "${TMPDIR}/minimal-keycloak-operator-manifest.yaml" -n ${NAMESPACE}

kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=keycloak-operator --namespace  ${NAMESPACE} --timeout=5m

logs=$(kubectl logs -l app.kubernetes.io/name=keycloak-operator -n ${NAMESPACE})

sleep 10

echo "$logs" | grep "Listening on: http://0.0.0.0:8080"

cat <<EOF > "${TMPDIR}/example-postgres.yaml"
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: postgresql-db
  namespace: ${NAMESPACE}
spec:
  serviceName: postgresql-db-service
  selector:
    matchLabels:
      app: postgresql-db
  replicas: 1
  template:
    metadata:
      labels:
        app: postgresql-db
    spec:
      containers:
        - name: postgresql-db
          image: postgres:15
          volumeMounts:
            - mountPath: /data
              name: cache-volume
          env:
            - name: POSTGRES_USER
              value: testuser
            - name: POSTGRES_PASSWORD
              value: testpassword
            - name: PGDATA
              value: /data/pgdata
            - name: POSTGRES_DB
              value: keycloak
      volumes:
        - name: cache-volume
          emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: postgres-db
  namespace: ${NAMESPACE}
spec:
  selector:
    app: postgresql-db
  type: LoadBalancer
  ports:
  - port: 5432
    targetPort: 5432
EOF

kubectl apply -f "${TMPDIR}"/example-postgres.yaml -n ${NAMESPACE}

kubectl wait --for=condition=ready pod --selector statefulset.kubernetes.io/pod-name=postgresql-db-0 -n ${NAMESPACE} --timeout=5m

chmod -R 777 "${TMPDIR}"

openssl req -subj '/CN=test.keycloak.org/O=Test Keycloak./C=US' -newkey rsa:2048 -nodes -keyout "${TMPDIR}/key.pem" -x509 -days 365 -out "${TMPDIR}/certificate.pem"
kubectl create secret tls example-tls-secret --cert "${TMPDIR}/certificate.pem" --key "${TMPDIR}/key.pem" -n ${NAMESPACE}

kubectl create secret generic keycloak-db-secret -n ${NAMESPACE} \
  --from-literal=username=testuser \
  --from-literal=password=testpassword


cat <<EOF > "${TMPDIR}/example-kc.yaml"
apiVersion: k8s.keycloak.org/v2alpha1
kind: Keycloak
metadata:
  name: example-kc
  namespace: ${NAMESPACE}
spec:
  instances: 1
  db:
    vendor: postgres
    host: postgres-db
    usernameSecret:
      name: keycloak-db-secret
      key: username
    passwordSecret:
      name: keycloak-db-secret
      key: password
  http:
    tlsSecret: example-tls-secret
  hostname:
    hostname: test.keycloak.org
  proxy:
    headers: xforwarded # double check your reverse proxy sets and overwrites the X-Forwarded-* headers
EOF

kubectl apply -f "${TMPDIR}"/example-kc.yaml -n ${NAMESPACE}

kubectl get keycloaks/example-kc -o go-template='{{range .status.conditions}}CONDITION: {{.type}}{{"\n"}}  STATUS: {{.status}}{{"\n"}}  MESSAGE: {{.message}}{{"\n"}}{{end}}' -n ${NAMESPACE}

sleep 10

kubectl wait --for=condition=ready pod --selector statefulset.kubernetes.io/pod-name=example-kc-0 -n ${NAMESPACE} --timeout=5m 

klogs=$(kubectl logs -l app=keycloak -n ${NAMESPACE})

sleep 10

echo "$klogs" | grep "Listening on: https://0.0.0.0:8443"