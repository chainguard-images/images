<!--monopod:start-->
# calico
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/calico` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/calico/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for calico

[Calico](https://projectcalico.docs.tigera.io/) is a networking and security solution that enables Kubernetes workloads and non-Kubernetes/legacy workloads to communicate seamlessly and securely.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/calico:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Installation

There are several ways you can install Calico onto a Kubernetes cluster. This document follows method recommended in the [official Calico documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico) which involves using the Tigera Calico operator. 

#### Install Tigera Operator

```yaml
helm repo add projectcalico https://projectcalico.docs.tigera.io/charts
helm repo update

helm install calico projectcalico/tigera-operator \
    --namespace tigera-operator \
    --create-namespace \
    --set autoDiscovery.clusterName=foo \
    --set tigeraOperator.registry=cgr.dev \
    --set tigeraOperator.image=chainguard/tigera-operator \
    --set tigeraOperator.version=latest
```

After setting up and connecting to the Kubernetes cluster where you want to install Calico, install the Tigera Calico operator and custom resource definitions (CRDs).

#### Create ImageSet 

> For Calico versions < 3.28, omit `calico/key-cert-provisioner` in the example
> below, as this was only introduced in v3.28.

ImageSet is a CRD provided by the Tigera operator. It is required to define
which images are used for Calico deployments.

Note, we do not pass the registry or image names here, only the image digests.
The registry is passed when creating a Calico cluster.

```yaml
apiVersion: operator.tigera.io/v1
kind: ImageSet
metadata:
  name: calico-v3.26.1
spec:
  images:
    - image: calico/node
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-node:latest)
    - image: calico/cni
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-cni:latest)
    - image: calico/kube-controllers
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-kube-controllers:latest)
    - image: calico/pod2daemon-flexvol
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-pod2daemon-flexvol:latest)
    - image: calico/csi
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-csi:latest)
    - image: calico/typha
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-typha:latest)
    - image: calico/node-driver-registrar
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-node-driver-registrar:latest)
    - image: calico/key-cert-provisioner
      digest: ... # Replace with $(crane digest cgr.dev/chainguard/calico-key-cert-provisioner:latest)
    # This isn't used on Linux, but it needs to have a value containing a valid digest.
    - image: calico/windows-upgrade
      digest: sha256:0000000000000000000000000000000000000000000000000000000000000000
```

#### Using different image names

Providing an ImageSet allows you to specify alternative image digests, but it
does not allow you to swap in custom image names. If you wish to use images that
are named differently, you'll need to first re-tag them.

For example, `/some/registry/node-fips:` would need to be re-tagged to
`/some/registry/node:`. The digest would be the same for both image tags.

#### Create Calico installation

Once the ImageSet is completed, specify the image registry and the image prefix
to use.

Our images follow `calico-` naming format, i.e `calico-node`, do we define an
`imagePrefix`.

```yaml
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  variant: Calico
  registry: cgr.dev
  imagePath: chainguard
  imagePrefix: calico-
```

The combination of these `ImageSet` and `Installation` CRDs serve as a drop in replacement for [Step 2 of the upstream documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart#install-calico). Together, these correctly rename the Calico images to their `cgr.dev` variants.

After creating the CRDs, you can ensure that the pods are running with a command like the following.

```shell
kubectl get pods -n calico-system
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