<!--monopod:start-->
# argo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/argo` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/argo/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for argo

Images for working with [Argo workflows](https://argoproj.github.io/argo-workflows/)

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/argo:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Versions

```
docker pull cgr.dev/chainguard/argo-exec
docker pull cgr.dev/chainguard/argo-cli
docker pull cgr.dev/chainguard/argo-workflowcontroller
```

## Using argo

Argo provides two upstream methods for installing, helm, and raw manifests.

The Chainguard Images for Argo are designed to be a drop in replacement for either method. To use them, simply replace the appropriate `image:` path with the Chainguard specific Argo image. Below is an example values file for doing this with helm:

```yaml

images:
  tag: "latest"
controller:
  image:
    # -- Registry to use for the controller
    registry: cgr.dev
    # -- Registry to use for the controller
    repository: chainguard/argo-workflow-controller
executor:
  image:
    # -- Registry to use for the Workflow Executors
    registry: cgr.dev
    # -- Repository to use for the Workflow Executors
    repository: chainguard/argo-exec
server:
  # -- Deploy the Argo Server
  image:
    # -- Registry to use for the server
    registry: cgr.dev
    # -- Repository to use for the server
    repository: chainguard/argo-cli
```

Using the above values, the helm commands become:

```bash
helm repo add argo https://argoproj.github.io/argo-helm

helm install argo-workflows argo/argo-workflows \
	--namespace argo-workflows \
	--create-namespace \
	--set images.tag="latest" \
	--set global.image.tag="latest" \
  --set controller.image.registry="cgr.dev" \
  --set controller.image.repository="chainguard/argo-workflow-controller" \
  --set executor.image.registry="cgr.dev" \
  --set executor.image.repository="chainguard/argo-exec" \
  --set server.image.registry="cgr.dev" \
  --set server.image.repository="chainguard/argo-cli"
```


> NOTE: Setting the tag to "latest" is not recommended, and only shown for illustrative purposes.
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