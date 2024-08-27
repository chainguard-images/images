<!--monopod:start-->
# keycloak-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/keycloak-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/keycloak-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A Kubernetes Operator based on the Operator SDK for installing and managing Keycloak.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/keycloak-operator:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

### Kubernetes

You can install the Operator on a vanilla Kubernetes cluster by using kubectl commands:

Install the CRDs by entering the following commands:

```bash
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/24.0.4/kubernetes/keycloaks.k8s.keycloak.org-v1.yml
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/24.0.4/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml
```

Next, install the Keycloak operator with Chainguard images using following steps: 


##### Step 1: Download the YAML file and save it with a different name
curl -o keycloak-operator.yml https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/24.0.4/kubernetes/kubernetes.yml

##### Step 2: Use sed to replace the image repository for Keycloak (adjust for macOS)
sed -i '' 's|quay\.io/keycloak/keycloak:.*|cgr.dev/chainguard/keycloak:latest|' keycloak-operator.yml

##### Step 3: Use sed to replace the image repository for Keycloak Operator (adjust for macOS)
sed -i '' 's|quay\.io/keycloak/keycloak-operator:.*|cgr.dev/chainguard/keycloak-operator:latest|' keycloak-operator.yml

##### Step 4: Apply the modified YAML file
kubectl apply -f keycloak-operator.yml

**NOTE** : The above sed commands were for MacOS (BSD based), for Linux GNU based, replace `sed -i '' 's`  with `sed -i 's`

Currently the Operator watches only the namespace where the Operator is installed.


### Basic Keycloak deployment with Keycloak Operator 

Once the Keycloak Operator is installed and running in the cluster namespace, you can set up the other deployment prerequisites.

* Database

* Hostname

* TLS Certificate and associated keys

#### Database

For development purposes, you can use an ephemeral PostgreSQL pod installation. To provision it, follow the approach below:

Create YAML file `example-postgres.yaml`:

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: postgresql-db
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
spec:
  selector:
    app: postgresql-db
  type: LoadBalancer
  ports:
  - port: 5432
    targetPort: 5432
```

Apply the changes:

```bash
kubectl apply -f example-postgres.yaml
```

#### Hostname

For a production ready installation, you need a hostname that can be used to contact Keycloak. See [Configuring the hostname](https://www.keycloak.org/server/hostname) for the available configurations.

For development purposes, this guide will use `test.keycloak.org`.

#### TLS Certificate and key
See your Certification Authority to obtain the certificate and the key.

For development purposes, you can enter this command to obtain a self-signed certificate:

```bash
openssl req -subj '/CN=test.keycloak.org/O=Test Keycloak./C=US' -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
```

You should install it in the cluster namespace as a Secret by entering this command:

```bash
kubectl create secret tls example-tls-secret --cert certificate.pem --key key.pem
```

### Deploying Keycloak

Consider storing the Database credentials in a separate Secret. Enter the following commands:

```bash
kubectl create secret generic keycloak-db-secret \
  --from-literal=username=testuser \
  --from-literal=password=testpassword
```

For a basic deployment, you can stick to the following approach:

Create YAML file `example-kc.yaml`:

```yaml
apiVersion: k8s.keycloak.org/v2alpha1
kind: Keycloak
metadata:
  name: example-kc
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
```

Apply the changes:

```bash
kubectl apply -f example-kc.yaml
```
To check that the Keycloak instance has been provisioned in the cluster, check the status of the created CR by entering the following command:

```bash
kubectl get keycloaks/example-kc -o go-template='{{range .status.conditions}}CONDITION: {{.type}}{{"\n"}}  STATUS: {{.status}}{{"\n"}}  MESSAGE: {{.message}}{{"\n"}}{{end}}'
```
When the deployment is ready, look for output similar to the following:

```yaml
CONDITION: Ready
  STATUS: true
  MESSAGE:
CONDITION: HasErrors
  STATUS: false
  MESSAGE:
CONDITION: RollingUpdate
  STATUS: false
  MESSAGE:
```

For further reference, please refer to [official documentation of the project](https://www.keycloak.org/guides#operator)
<!--body:end-->
