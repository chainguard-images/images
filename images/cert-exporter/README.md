<!--monopod:start-->
# cert-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cert-exporter` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/cert-exporter/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for cert-exporter

A minimal, wolfi-based image for cert-exporter: an application that exports certificate expiration metrics from disk, Kubernetes, and AWS Secrets Manager to Prometheus.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/cert-exporter:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage
For full instructions on how to run cert-exporter, please refer to the upstream
GitHub repositories [documentation](https://github.com/joe-elliott/cert-exporter).

> **NOTE:** cert-exporter is intended to run inside a Kubernetes cluster. If you
> attempt to run locally, it'll hang and doesn't print anything to the logs.

### Helm
To deploy via helm, please refer to the upstream
[helm charts documentation](https://github.com/joe-elliott/cert-exporter/tree/master/helm/cert-exporter)
for comprehensive instructions, which includes
[supported parameters](https://github.com/joe-elliott/cert-exporter/blob/master/helm/cert-exporter/values.yaml).

Below is an example of how to use the helm chart, overriding the image with the
chainguard image:

```bash
helm repo add cert-exporter https://joe-elliott.github.io/cert-exporter/

# The chart will error if this doesn't already exist, however it does not use this ns directly.
kubectl create namespace monitoring

helm install cert-exporter cert-exporter/cert-exporter  \
 --set image.repository=cgr.dev/chainguard/cert-exporter \
 --set image.tag=latest
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