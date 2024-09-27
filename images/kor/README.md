<!--monopod:start-->
# kor
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kor` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kor/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for kor

A Golang Tool to discover unused Kubernetes Resources

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/kor:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
# Kor - Kubernetes Orphaned Resources Finder

Kor is a tool to discover unused Kubernetes resources. Currently, Kor can identify and list unused:
- ConfigMaps  
- Secrets
- Services
- ServiceAccounts
- Deployments
- StatefulSets
- Roles
- HPAs
- PVCs
- Ingresses
- PDBs
- CRDs

![Kor Screenshot](/images/screenshot.png)

for more information refer [kor](https://github.com/yonahd/kor)

## Installation

### Docker
Run a container with your kubeconfig mounted:
```sh
docker run --rm -i cgr.dev/chainguard/kor:latest

docker run --rm -i -v "/path/to/.kube/config:/root/.kube/config" cgr.dev/chainguard/kor:latest all
```

### Helm
Run as a cronjob in your Cluster (with an option for sending slack updates)

```sh
git clone https://github.com/yonahd/kor.git
```

```sh
helm upgrade --install kor \
    --namespace kor \
    --create-namespace \
    --set cronJob.enabled=true \
    --set cronJob.image.repository=cgr.dev/chainguard/kor \
    --set cronJob.image.tag=latest \
    --set prometheusExporter.enabled=true \
    --set prometheusExporter.deployment.image.repository=cgr.dev/chainguard/kor \
    --set prometheusExporter.deployment.image.tag=latest \
    --wait \
    --timeout=300s \
    ./kor/charts/kor
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