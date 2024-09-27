<!--monopod:start-->
# tekton
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/tekton` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/tekton/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for tekton

[Tekton](https://tekton.dev) provides a cloud-native Pipeline resource, mainly intended for CI/CD use cases.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/tekton:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
[Tekton](https://tekton.dev) provides a cloud-native Pipeline resource, mainly intended for CI/CD use cases.

[Tekton Chains](https://tekton.dev/docs/chains/) provides additional supply chain security features.

The [Tekton CLI](https://tekton.dev/docs/cli/) is a command-line interface for Tekton.

## Usage

These images a drop-in replacement for the upstream images.

You can use an [upstream release](https://github.com/tektoncd/pipeline/releases) and replace the released images with those from Chainguard.

```shell
curl -sL https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/controller[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-controller|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/entrypoint[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-entrypoint|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/events[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-events|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/nop[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-nop|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/resolvers[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-resolvers|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/sidecarlogresults[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-sidecarlogresults|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/webhook[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-webhook|g" | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/workingdirinit[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-workingdirinit|g" | \
    kubectl apply -f -
```

For Tekton Chains:

```shell
curl -sL https://storage.googleapis.com/tekton-releases/chains/latest/release.yaml | \
    sed "s|gcr.io/tekton-releases/github.com/tektoncd/chains/cmd/controller[a-z0-9:@.]\{1,\}|cgr.dev/chainguard/tekton-chains|g" | \
    kubectl apply -f -
```

For Tekton CLI:

```
docker run cgr.dev/chainguard/tekton-cli version
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