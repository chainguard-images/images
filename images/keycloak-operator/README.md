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
# Chainguard Image for keycloak-operator

A Kubernetes Operator based on the Operator SDK for installing and managing Keycloak.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/keycloak-operator:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.