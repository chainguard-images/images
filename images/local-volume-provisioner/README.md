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
# Chainguard Image for local-volume-provisioner

Static provisioner of local volumes

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/local-volume-provisioner:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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