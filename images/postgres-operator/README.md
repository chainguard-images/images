<!--monopod:start-->
# postgres-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/postgres-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/postgres-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for postgres-operator

Creates and manages PostgreSQL clusters running in Kubernetes.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/postgres-operator:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

The operator can be installed by using the provided
[Helm](https://opensource.zalando.com/postgres-operator/docs/quickstart.html#deployment-options) chart which saves you the manual steps. The charts for both the Postgres Operator and its UI are hosted via the `gh-pages` branch.
They only work only with Helm v3. Helm v2 support was dropped with v1.8.0.

```bash
# add repo for postgres-operator
helm repo add postgres-operator-charts https://opensource.zalando.com/postgres-operator/charts/postgres-operator

# install the postgres-operator
helm install postgres-operator postgres-operator-charts/postgres-operator  \
 --set image.registry=cgr.dev \
 --set image.repository=chainguard/postgres-operator \
 --set image.tag=latest
```

### Check if Postgres Operator is running

Starting the operator may take a few seconds. Check if the operator pod is
running before applying a Postgres cluster manifest.

```bash
# if you've created the operator using yaml manifests
kubectl get pod -l name=postgres-operator

# if you've created the operator using helm chart
kubectl get pod -l app.kubernetes.io/name=postgres-operator
```

If the operator doesn't get into `Running` state, either check the latest K8s
events of the deployment or pod with `kubectl describe` or inspect the operator
logs:

```bash
kubectl logs "$(kubectl get pod -l name=postgres-operator --output='name')"
```

### Create a Postgres cluster

If the operator pod is running it listens to new events regarding `postgresql`
resources. Now, it's time to submit your first Postgres cluster manifest.

```bash
# create a Postgres cluster
cat <<EOF > "${TMPDIR}/minimal-postgres-manifest.yaml"
apiVersion: "acid.zalan.do/v1"
kind: postgresql
metadata:
  name: acid-minimal-cluster
spec:
  teamId: "acid"
  volume:
    size: 1Gi
  numberOfInstances: 2
  users:
    zalando:  # database owner
    - superuser
    - createdb
    foo_user: []  # role for application foo
  databases:
    foo: zalando  # dbname: owner
  preparedDatabases:
    bar: {}
  postgresql:
    version: "16"
EOF

kubectl create -f "${TMPDIR}/minimal-postgres-manifest.yaml" 
```

After the cluster manifest is submitted and passed the validation the operator
will create Service and Endpoint resources and a StatefulSet which spins up new
Pod(s) given the number of instances specified in the manifest. All resources
are named like the cluster. The database pods can be identified by their number
suffix, starting from `-0`. They run the [Spilo](https://github.com/zalando/spilo)
container image by Zalando. As for the services and endpoints, there will be one
for the master pod and another one for all the replicas (`-repl` suffix). Check
if all components are coming up. Use the label `application=spilo` to filter and
list the label `spilo-role` to see who is currently the master.

```bash
# check the deployed cluster
kubectl get postgresql

# check created database pods
kubectl get pods -l application=spilo -L spilo-role

# check created service resources
kubectl get svc -l application=spilo -L spilo-role
```

### Connect to the Postgres cluster via psql

```bash
# get name of master pod of acid-minimal-cluster
export PGMASTER=$(kubectl get pods -o jsonpath={.items..metadata.name} -l application=spilo,cluster-name=acid-minimal-cluster,spilo-role=master -n default)

# set up port forward
kubectl port-forward $PGMASTER 6432:5432 -n default
```

Open another CLI and connect to the database using e.g. the psql client.
When connecting with a manifest role like `foo_user` user, read its password
from the K8s secret which was generated when creating `acid-minimal-cluster`.
As non-encrypted connections are rejected by default set SSL mode to `require`:

```bash
export PGPASSWORD=$(kubectl get secret postgres.acid-minimal-cluster.credentials.postgresql.acid.zalan.do -o 'jsonpath={.data.password}' | base64 -d)
export PGSSLMODE=require
psql -U postgres -h localhost -p 6432
```
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