
# Testing with k8ssandra-operator

The k8ssandra-operator is one of the common approaches for deploying the
Cassandra management API image.

Whilst we already have some automated test coverage for this image, we've ran
into some issues trying to extend it to include usage of k8ssandra-operator.
Here are the steps documented below:

## Step 1: Create k8s cluster

Create a new local k8s cluster for testing using k3d:

```bash
k3d cluster create
```

## Step 2: Deploy cert-manager

Cassandra requires this as a pre-requisite. We're still utilizing the Chainguard
images here for cert manager:

```bash
# Replace `--version`` accordingly, refer to helm chart documentation.
helm repo add jetstack https://charts.jetstack.io && helm repo update
helm install \
  cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --create-namespace \
    --version v1.15.0 \
    --set image.repository=cgr.dev/chainguard/cert-manager-controller \
    --set image.tag=latest \
    --set cainjector.image.repository=cgr.dev/chainguard/cert-manager-cainjector \
    --set cainjector.image.tag=latest \
    --set acmesolver.image.repository=cgr.dev/chainguard/cert-manager-acmesolver \
    --set acmesolver.image.tag=latest \
    --set webhook.image.repository=cgr.dev/chainguard/cert-manager-webhook \
    --set webhook.image.tag=latest \
    --set installCRDs=true
```

## Step 3: Deploy k8ssandra-operator

The k8ssandra-operator, when installed, can be used to stand up Cassandra
clusters. We also have a Chainguard image for this, which we're utilizing below:

```bash
helm repo add k8ssandra https://helm.k8ssandra.io/stable && helm repo update
helm install k8ssandra-operator k8ssandra/k8ssandra-operator \
  --set image.registry=cgr.dev \
  --set image.repository=chainguard/k8ssandra-operator \
  --set image.tag=latest
```

## Step 4: Create a new Cassandra cluster

The below uses the `K8ssandraCluster` CRD, provided by the operator, to deploy
a new Cassandra cluster:

> **Ensure you update the IMAGE and CASSANDRA VERSION below!**

```bash
kubectl apply -f - <<-EOF
  apiVersion: k8ssandra.io/v1alpha1
  kind: K8ssandraCluster 
  metadata:
    name: cassandra-cluster
  spec:
    cassandra:
      # UPDATE ME! Specify Cassandra version you are deploying!
      serverVersion: 4.1.5
      # UPDATE ME! Specify image you are testing!
      serverImage: cgr.dev/chainguard/management-api-for-apache-cassandra:latest
      superuserSecretRef:
        name: cassandra-secret
      datacenters:
        - metadata:
            name: k3d
          size: 1
          storageConfig:
            cassandraDataVolumeClaimSpec:
              storageClassName: local-path
              accessModes:
                - ReadWriteOnce
              resources:
                requests:
                  storage: 1Gi
          config:
            jvmOptions:
              heapSize: 2Gi
EOF
```

Once deployed, it'll take 2-5 minutes for the Cassandra cluster to become fully
operational, after which, you should see:

```bash
% k get po
NAME                                                READY   STATUS    RESTARTS   AGE
k8ssandra-operator-ffccf7675-28xmw                  1/1     Running   0          23m
k8ssandra-operator-cass-operator-67bc8d99d6-q5ggg   1/1     Running   0          23m
cassandra-cluster-k3d-default-sts-0                 2/2     Running   0          22m
```

## Step 5: Retrieve credentials

The Cassandra mgmt-api image enables authentication by default. You can create
your own custom creds (as a k8s secret), and pipe them into the manifest in
step 4, but for this example we're going to leverage the default creds created.

Lets retrieve them!

```bash
export CASS_USERNAME=$(kubectl get secret cassandra-secret -o json | jq -r '.data.username' | base64 --decode)
export CASS_PASSWORD=$(kubectl get secret cassandra-secret -o json | jq -r '.data.password' | base64 --decode)
```

## Step 6: Checking status of cluster

The `nodetool` command can be used to check and validate if all nodes in the
Cassandra cluster are ready. It requires credentials (above). Example:

```bash
k exec -it cassandra-cluster-k3d-default-sts-0 -- nodetool -u $CASS_USERNAME -pw $CASS_PASSWORD status
```

Which should return something similar to:

```bash
Datacenter: k3d
===============
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address     Load       Tokens  Owns (effective)  Host ID                               Rack
UN  10.42.0.16  91.57 KiB  16      100.0%            3573f5d0-7a01-4a98-a599-153491c9d993  default
```

## Step 7: Using cqlsh

cqlsh is the command line tool used to read and write data to Cassandra. It can
be used from within the Cassandra pod, and also externally. Lets make sure it
is working:

```bash
k exec -it cassandra-cluster-k3d-default-sts-0 -- cqlsh -u $CASS_USERNAME -p $CASS_PASSWORD
```

Which should result in a cqlsh shell:

```bash
Connected to cassandra-cluster at 127.0.0.1:9042
[cqlsh 6.0.0 | Cassandra 4.0.13 | CQL spec 3.4.5 | Native protocol v5]
Use HELP for help.
cassandra-secret@cqlsh>
cassandra-secret@cqlsh>
```

Next, lets write some data:

```bash
kubectl exec -i cassandra-cluster-k3d-default-sts-0 -- cqlsh -u $CASS_USERNAME -p $CASS_PASSWORD <<-EOF
  CREATE KEYSPACE testkeyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
  USE testkeyspace;
  CREATE TABLE users (user_id UUID PRIMARY KEY, name text);
  INSERT INTO users (user_id, name) VALUES (uuid(), 'Chainguard');
  SELECT * FROM users;
EOF
```

Which should result in:

```bash
user_id                              | name
--------------------------------------+------------
 7ec5f712-7fb6-4c8c-955c-9489a75f7e33 | Chainguard

(1 row)
```

And a sample read:

```bash
kubectl exec cassandra-cluster-k3d-default-sts-0 -- cqlsh -u $CASS_USERNAME -p $CASS_PASSWORD -e "USE testkeyspace; SELECT * FROM users;"
```
