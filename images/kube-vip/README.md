<!--monopod:start-->
# kube-vip
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kube-vip` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kube-vip/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for kube-vip

Kubernetes Control Plane Virtual IP and Load-Balancer

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/kube-vip:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

## Deployment

kube-vip has [documentation](https://kube-vip.io/docs/installation) covering
deployments. They don't make any reference to helm charts, although there seems
to be one published separately (see section below).

The deploy instructions differ depending on your k8s environment. Refer to
the upstream docs](https://kube-vip.io/docs/installation) for the correct set
of instructions. Be sure to replace the image reference in any manifests to the
Chainguard image.

For reference, [here are some steps](https://github.com/chainguard-images/images/blob/main/images/kube-vip/TESTING.md)
we followed to setup a local test environment using a local k3d cluster.

### Helm

kube-vip publishes a [helm chart](https://artifacthub.io/packages/helm/kube-vip/kube-vip)
for deploying the image. **However**, they have commented out 'tag' in the
[values.yaml](https://github.com/kube-vip/helm-charts/blob/5f24093899db53f7c103bd95b0e41a112bbfb72b/charts/kube-vip/values.yaml#L8):

```bash
image:
  repository: ghcr.io/kube-vip/kube-vip
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  # tag: "v0.7.0"
```

If you wish to use this helm chart, you'll need to provide a custom values.yaml
file, which is updated to use the chainguard image and latest tag:

```bash
helm repo add kube-vip https://kube-vip.github.io/helm-charts/
helm install my-kube-vip kube-vip/kube-vip -f my-custom-values.yaml
```

> [!WARNING]
> During testing with the original (non-chainguard) image, we did not have
> much success getting a successful deployment. On occasions, our local k8s
> cluster to become unresponsive. If you are referring to this chart, we would
> advise you to test out in a non-production environment first.
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