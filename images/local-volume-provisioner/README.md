<!--monopod:start-->
# local-volume-provisioner
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/local-volume-provisioner` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/local-volume-provisioner/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Static provisioner of local volumes
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/local-volume-provisioner:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

To be able to test the local volume provisioner, you need to have a Kubernetes cluster running. You can use [k3d](https://k3d.io//) to create a local cluster.

### Create a local cluster

```bash

k3d create cluster
```

### Deploy the local volume provisioner

```bash
# creates the necessary StorageClass
kubectl apply -f kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/default_example_storageclass.yaml

# creates the local volume provisioner
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/default_example_provisioner_generated.yaml

# changes the provisioner image to the one you want to test
kubectl set image daemonset/local-volume-provisioner provisioner="cgr.dev/chainguard/local-volume-provisioner:latest"

```

Please ensure that the local volume provisioner is running before moving to the next step:

```bash
kubectl rollout status daemonset/local-volume-provisioner --timeout=120s
```

So, if everything is running, you should shell/exec into the nodes and do the following:

```bash
# Get server and worker node names from k3d, filtering by role
node_names=$(k3d node list -o json | jq -r '.[] | select(.role == "server" or .role == "agent") | .name')

# Loop over each node name and execute the commands
for node in $node_names; do
    echo "Configuring node: $node"

    # Create directory
    docker exec $node mkdir -p /mnt/fast-disks/vol1

    # Mount tmpfs
    docker exec $node mount -t tmpfs vol1 /mnt/fast-disks/vol1

    echo "Configuration complete for node: $node"
done
```

Once you have the local disks mounted, you should see the PVs created:

```bash
kubectl get pv
```

That's it! You have the local volume provisioner running and managing the local disks on your cluster.

<!--body:end-->
