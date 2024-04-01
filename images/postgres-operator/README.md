<!--monopod:start-->
# postgres-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/postgres-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/postgres-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
TODO
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/postgres-operator:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The operator can be installed by using the provided
[Helm](https://helm.sh/) chart which saves you the manual steps. The charts
for both the Postgres Operator and its UI are hosted via the `gh-pages` branch.
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

You can create a port-forward on a database pod to connect to Postgres. See the
[user guide](user.md#connect-to-postgresql) for instructions. With minikube it's
also easy to retrieve the connections string from the K8s service that is
pointing to the master pod:

```bash
export HOST_PORT=$(minikube service acid-minimal-cluster --url | sed 's,.*/,,')
export PGHOST=$(echo $HOST_PORT | cut -d: -f 1)
export PGPORT=$(echo $HOST_PORT | cut -d: -f 2)
```

Retrieve the password from the K8s Secret that is created in your cluster.
Non-encrypted connections are rejected by default, so set the SSL mode to
require:

```bash
export PGPASSWORD=$(kubectl get secret postgres.acid-minimal-cluster.credentials.postgresql.acid.zalan.do -o 'jsonpath={.data.password}' | base64 -d)
export PGSSLMODE=require
psql -U postgres
```

### Delete a Postgres cluster

To delete a Postgres cluster simply delete the `postgresql` custom resource.

```bash
kubectl delete postgresql acid-minimal-cluster
```

<!--body:end-->
