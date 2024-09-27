<!--monopod:start-->
# newrelic-k8s-events-forwarder
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/newrelic-k8s-events-forwarder` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/newrelic-k8s-events-forwarder/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for newrelic-k8s-events-forwarder

Minimal [newrelic-k8s-events-forwarder](https://github.com/newrelic/nri-kubernetes) container image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/newrelic-k8s-events-forwarder:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

These images are a drop-in replacement for the `newrelic` project. The images are tested against the upstream recommended [`nri-bundle`](https://github.com/newrelic/helm-charts/tree/master/charts/nri-bundle). chart.

A minimum sample of the `values.yaml` required to replace the installation with Chainguard Images is below:

> Note that `latest` is used below for brevity. In long term deployments this is discouraged.

```yaml
# minimal-values.yaml
global:
  cluster: $CLUSTER_NAME
  licenseKey: $LICENSE_KEY

newrelic-infrastructure:
  images:
    agent:
      registry: cgr.dev
      repository: chainguard/newrelic-infrastructure-bundle
      tag: latest
    integration:
      registry: cgr.dev
      repository: chainguard/newrelic-nri-kubernetes
      tag: latest

nri-prometheus:
  enabled: true
  image:
    registry: cgr.dev
    repository: chainguard/newrelic-nri-prometheus
    tag: latest

nri-kube-events:
  enabled: true
  images:
    integration:
      registry: cgr.dev
      repository: chainguard/newrelic-kube-events
      tag: latest
    agent:
      registry: cgr.dev
      repository: chainguard/newrelic-k8s-events-forwarder
      tag: latest

newrelic-logging:
  enabled: true
  image:
    repository: cgr.dev/chainguard/newrelic-fluent-bit-output
    tag: latest

newrelic-prometheus-agent:
  enabled: true
  images:
    configurator:
      registry: cgr.dev
      repository: chainguard/newrelic-prometheus-agent
      tag: latest
    prometheus:
      registry: cgr.dev
      repository: chainguard/prometheus
      tag: latest
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