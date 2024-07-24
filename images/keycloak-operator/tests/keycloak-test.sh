#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Function to retry a command until it succeeds or reaches max attempts
# Arguments:
#   $1: max_attempts
#   $2: interval (seconds)
#   $3: description of the operation
#   ${@:4}: command to execute
retry_command() {
    local max_attempts=$1
    local interval=$2
    local description=$3
    local cmd="${@:4}"
    local attempt=1

    echo "Retrying: $description"
    while [ $attempt -le $max_attempts ]; do
        echo "Attempt $attempt: $cmd"
        if eval $cmd; then
            echo "Success on attempt $attempt for: $description"
            return 0
        else
            echo "Failure on attempt $attempt for: $description"
            sleep $interval
        fi
        ((attempt++))
    done

    # In the event we fail, print out the status of resources in the cluster.
    kubectl get all --all-namespaces

    echo "Error: Failed after $max_attempts attempts for: $description"
    return 1
}

# Define variables for Keycloak hostname and port
KEYCLOAK_HOSTNAME="localhost"
KEYCLOAK_PORT=8443
KEYCLOAK_URL="https://${KEYCLOAK_HOSTNAME}:${KEYCLOAK_PORT}"

TMPDIR="$(mktemp -d)"
NAMESPACE="keycloak-test"
REQUEST_RETRIES=5
RETRY_DELAY=10
 
apk add jq curl openssl openssl-config yq

# Function to test Keycloak API
TEST_keycloak_api() {
  local attempt=0
  local success=false

  # Retrieve the initial admin credentials
  local admin_username=$(kubectl get secret example-kc-initial-admin -n ${NAMESPACE} -o jsonpath='{.data.username}' | base64 -d)
  local admin_password=$(kubectl get secret example-kc-initial-admin -n ${NAMESPACE} -o jsonpath='{.data.password}' | base64 -d)

  while (( attempt < ${REQUEST_RETRIES} )); do
    # Get an API token for Keycloak.
    local response=$(
      curl --http1.1 -k -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
        -X POST \
        "${KEYCLOAK_URL}/realms/master/protocol/openid-connect/token" \
        --user "admin-cli:Psip5UvTO1EXUEwzb15nxLWnwdU1Nlcg" \
        -H "content-type: application/x-www-form-urlencoded" \
        -d "username=${admin_username}" \
        -d "password=${admin_password}" \
        -d "grant_type=password"
    )

    local response_code=$(echo "${response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
    local content=$(echo "${response}" | sed '/HTTP_STATUS_CODE/d')

    if [[ "${response_code}" == "200" ]]; then
      local access_token=$(echo "${content}" | jq --raw-output '.access_token')

      # Invoke Keycloak's API to retrieve a list of users.
      local users_output=$(curl --http1.1 -kv -X GET "${KEYCLOAK_URL}/admin/realms/master/users" \
        -H "Authorization: Bearer ${access_token}")
      success=true
      break
    else
      sleep ${RETRY_DELAY}
    fi
    attempt=$((attempt+1))
  done

  if ! $success; then
    echo "ERROR: Failed to get user data from the API after ${REQUEST_RETRIES} attempts." >&2
    return 1
  fi

  # Ensure that an 'admin' user was returned in the API response.
  extracted_username=$(echo "${users_output}" | jq -r '.[] | select(.username=="admin") | .username')
  if [[ "${extracted_username}" == "admin" ]]; then
    echo "Keycloak API correctly returned 'admin' user details."
  else
    echo "FAILED: No entry with username 'admin' found in the response: ${users_output}"
    exit 1
  fi
}

# Function to create a new realm if it doesn't exist
create_realm_if_not_exists() {
  local realm_name="test-realm"
  local admin_username=$(kubectl get secret example-kc-initial-admin -n ${NAMESPACE} -o jsonpath='{.data.username}' | base64 -d)
  local admin_password=$(kubectl get secret example-kc-initial-admin -n ${NAMESPACE} -o jsonpath='{.data.password}' | base64 -d)

  # Get an API token for Keycloak.
  local token_response
  token_response=$(curl --http1.1 -k -sS -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
    -X POST "${KEYCLOAK_URL}/realms/master/protocol/openid-connect/token" \
    --user "admin-cli:Psip5UvTO1EXUEwzb15nxLWnwdU1Nlcg" \
    -H "content-type: application/x-www-form-urlencoded" \
    -d "username=${admin_username}" \
    -d "password=${admin_password}" \
    -d "grant_type=password")

  local response_code=$(echo "${token_response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
  local token_content=$(echo "${token_response}" | sed '/HTTP_STATUS_CODE/d')
  local access_token=$(echo "${token_content}" | jq --raw-output '.access_token')

  if [[ "${response_code}" != "200" ]]; then
    echo "ERROR: Failed to get access token for Keycloak API." >&2
    return 1
  fi

  # Check if the realm exists
  local check_response
  check_response=$(curl --http1.1 -k -sS -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
    -X GET "${KEYCLOAK_URL}/admin/realms/${realm_name}" \
    -H "Authorization: Bearer ${access_token}" \
    -H "Accept: application/json")

  local check_code=$(echo "${check_response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)

  if [[ "${check_code}" == "404" ]]; then
    # Create the realm
    local create_response
    create_response=$(curl --http1.1 -k -sS -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
      -X POST "${KEYCLOAK_URL}/admin/realms" \
      -H "Authorization: Bearer ${access_token}" \
      -H "Content-Type: application/json" \
      -d '{
        "realm": "'"${realm_name}"'",
        "enabled": true,
        "users": [
          {
            "username": "test-user",
            "enabled": true,
            "emailVerified": true,
            "firstName": "Test",
            "lastName": "User",
            "email": "test-user@example.com",
            "credentials": [
              {
                "type": "password",
                "value": "test-password",
                "temporary": false
              }
            ]
          }
        ]
      }')

    local create_code=$(echo "${create_response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)

    if [[ "${create_code}" != "201" ]]; then
      echo "ERROR: Failed to create the realm." >&2
      return 1
    fi
  elif [[ "${check_code}" != "200" ]]; then
    echo "ERROR: Failed to check the existence of the realm." >&2
    return 1
  fi
}


# Function to test Keycloak Realm Import
TEST_keycloak_realm_import() {
  local realm_name="test-realm"
  local attempt=0
  local success=false

  # Retrieve the initial admin credentials
  local admin_username=$(kubectl get secret example-kc-initial-admin -n ${NAMESPACE} -o jsonpath='{.data.username}' | base64 -d)
  local admin_password=$(kubectl get secret example-kc-initial-admin -n ${NAMESPACE} -o jsonpath='{.data.password}' | base64 -d)

  # Get an API token for Keycloak.
  local token_response
  token_response=$(curl --http1.1 -k -sS -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
    -X POST "${KEYCLOAK_URL}/realms/master/protocol/openid-connect/token" \
    --user "admin-cli:Psip5UvTO1EXUEwzb15nxLWnwdU1Nlcg" \
    -H "content-type: application/x-www-form-urlencoded" \
    -d "username=${admin_username}" \
    -d "password=${admin_password}" \
    -d "grant_type=password")

  local response_code=$(echo "${token_response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
  local token_content=$(echo "${token_response}" | sed '/HTTP_STATUS_CODE/d')
  local access_token=$(echo "${token_content}" | jq --raw-output '.access_token')

  if [[ "${response_code}" != "200" ]]; then
    echo "ERROR: Failed to get access token for Keycloak API." >&2
    return 1
  fi

  # Export the existing realm
  local export_response
  export_response=$(curl --http1.1 -k -sS -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
    -X GET "${KEYCLOAK_URL}/admin/realms/${realm_name}" \
    -H "Authorization: Bearer ${access_token}" \
    -H "Accept: application/json")

  local export_code=$(echo "${export_response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)
  local export_content=$(echo "${export_response}" | sed '/HTTP_STATUS_CODE/d')

  if [[ "${export_code}" != "200" ]]; then
    echo "ERROR: Failed to export the existing realm." >&2
    return 1
  fi

  echo "${export_content}" > "${TMPDIR}/${realm_name}-realm-export.json"

  # Delete the existing realm
  local delete_response
  delete_response=$(curl --http1.1 -k -sS -w "\nHTTP_STATUS_CODE:%{http_code}\n" \
    -X DELETE "${KEYCLOAK_URL}/admin/realms/${realm_name}" \
    -H "Authorization: Bearer ${access_token}")

  local delete_code=$(echo "${delete_response}" | grep "HTTP_STATUS_CODE:" | cut -d':' -f2)

  if [[ "${delete_code}" != "204" ]]; then
    echo "ERROR: Failed to delete the existing realm." >&2
    return 1
  fi

  # Convert the exported JSON to YAML
  jq '.' "${TMPDIR}/${realm_name}-realm-export.json" | yq -P > "${TMPDIR}/${realm_name}-realm-export.yaml"

  # Create a new KeycloakRealmImport CR to import the realm from YAML
  cat <<EOF | kubectl apply -f -
apiVersion: k8s.keycloak.org/v2alpha1
kind: KeycloakRealmImport
metadata:
  name: ${realm_name}-realm-import
  namespace: ${NAMESPACE}
spec:
  keycloakCRName: example-kc
  realm:
$(cat "${TMPDIR}/${realm_name}-realm-export.yaml" | sed 's/^/    /')
EOF

  # Wait for the realm import to complete
  retry_command 5 15 "keycloak-realm-import"  kubectl wait --for=condition=complete job/test-realm-realm-import -n ${NAMESPACE} --timeout=2m
  # Wait for the realm import logs to populate
  for (( attempt=0; attempt<${REQUEST_RETRIES}; attempt++ )); do
    sleep ${RETRY_DELAY}
    local realm_logs=$(kubectl logs -l app=keycloak-realm-import -n ${NAMESPACE})
    if echo "${realm_logs}" | grep -q "Realm '${realm_name}' imported"; then
      success=true
      break
    fi
  done

  if ! $success; then
    echo "ERROR: Failed to import the realm configuration after ${REQUEST_RETRIES} attempts." >&2
    return 1
  fi
}


# Create Namespace and CRDs
if kubectl get ns | grep -qw $NAMESPACE; then
    echo "Namespace $NAMESPACE already exists."
else
    echo "Namespace $NAMESPACE does not exist. Creating it now..."
    kubectl create namespace $NAMESPACE
    if [ $? -eq 0 ]; then
        echo "Namespace $NAMESPACE created successfully."
    else
        echo "Failed to create namespace $NAMESPACE."
    fi
fi

kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/${KEYCLOAK_VERSION}/kubernetes/keycloaks.k8s.keycloak.org-v1.yml
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/${KEYCLOAK_VERSION}/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml

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
    app.kubernetes.io/version: ${KEYCLOAK_VERSION}
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
    app.kubernetes.io/version: ${KEYCLOAK_VERSION}
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
    app.kubernetes.io/version: ${KEYCLOAK_VERSION}
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
    app.kubernetes.io/version: ${KEYCLOAK_VERSION}
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
        app.kubernetes.io/version: ${KEYCLOAK_VERSION}
        app.kubernetes.io/name: keycloak-operator
    spec:
      containers:
        - env:
            - name: KUBERNETES_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: RELATED_IMAGE_KEYCLOAK
              # Hardcoding it to upstream as keycloak operator depends upon keycloak which cant be released as both are interdependent on each other
              value: keycloak/keycloak:latest
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

retry_command 5 15 "keycloak-operator pod readiness" kubectl wait --for=condition=ready pod --selector app.kubernetes.io/name=keycloak-operator --namespace ${NAMESPACE} --timeout=5m

# using sleep as retry_command failed for logs to populate
sleep 5

logs=$(kubectl logs -l app.kubernetes.io/name=keycloak-operator -n ${NAMESPACE})

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

retry_command 5 15 "postgresql-db-0 readiness" kubectl wait --for=condition=ready pod --selector statefulset.kubernetes.io/pod-name=postgresql-db-0 -n ${NAMESPACE} --timeout=5m

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
    hostname: ${KEYCLOAK_HOSTNAME}
  proxy:
    headers: xforwarded # double check your reverse proxy sets and overwrites the X-Forwarded-* headers
EOF

kubectl apply -f "${TMPDIR}"/example-kc.yaml -n ${NAMESPACE}

retry_command 5 15 "example-kc pod readiness" kubectl wait --for=condition=ready pod --selector statefulset.kubernetes.io/pod-name=example-kc-0 -n ${NAMESPACE} --timeout=5m 

# using sleep as retry_command failed for logs to populate
sleep 5

klogs=$(kubectl logs -l app=keycloak -n ${NAMESPACE})

echo "$klogs" | grep "Listening on: https://0.0.0.0:8443"

# Set up port forwarding
kubectl port-forward svc/example-kc-service ${KEYCLOAK_PORT}:8443 -n ${NAMESPACE} &

# Wait for port forwarding
sleep 5

# Call the Keycloak API test function
TEST_keycloak_api

# Call the Keycloak Realm Import test function
create_realm_if_not_exists
TEST_keycloak_realm_import