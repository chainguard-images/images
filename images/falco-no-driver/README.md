<!--monopod:start-->
# falco-no-driver
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/falco-no-driver` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/falco-no-driver/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for falco-no-driver

A minimal, [wolfi](https://github.com/wolfi-dev)-based image for falco-no-driver. This streamlined variant of [Falco](https://github.com/falcosecurity/falco/tree/master) designed for real-time security monitoring on Linux, replaces the traditional kernel module with eBPF technology, thus enhancing portability in containerized environments.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/falco-no-driver:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## How does falco-no-driver differ over falco?

The primary distinction between falco, and falco-no-driver (i.e this image),
lies in their approach to monitoring system calls.

Falco requires a kernel-specific module to hook into the system an monitor
system calls.

In contrast, falco-no-driver does not depend on a kernel-specific module,
instead leveraging eBPF (modern-bpf driver). This eliminates the need for
loading sepatate kernel modules and makes the image more portable, between
environments.

When we talk about falco-no-driver, this means no kernel drivers.
falco-no-driver is bundled with the modern-bpf driver itself. This can be
confusing and is worth clarifying.

## Disclaimer: falco doesn't run on macOS!

If you are intending on testing this image locally, note that falco does not run
on macOS. If you attempt to run the image it will fail to launch. See the
[following falco documentation](https://falco.org/blog/falco-apple-silicon/),
where they recommend setting up a linux VM.

> Note: You can launch the image on mac by passing in the `--nodriver` argument
> instead of `--modern-bpf`, but other than running the service, it'll not
> collect anything, so shouldn't be used in place of a linux environment for testing.

## Running falco-no-driver

Please refer to the [upstream documentation](https://falco.org/docs/install-operate/running/)
for instructions on how to configure and run falco-no-driver. The below examples
are intended as demonstrating how to substitute with the chainguard image, and
are not comprehensive.

### Docker

```bash
docker run --rm -i -t \
    --privileged \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /proc:/host/proc:ro \
    cgr.dev/chainguard/falco:latest falco --modern-bpf
```

### Helm chart

The deployment of Falco in a Kubernetes cluster is managed through a Helm chart. Documentation on this helm chart is available [here](https://github.com/falcosecurity/charts)

To install falco-no-driver image supporting modern bpf probe,
```
    helm repo add falcosecurity https://falcosecurity.github.io/charts
    helm repo update

    helm install falco \
    --namespace falco --create-namespace  \
    --set image.registry=cgr.dev \
    --set image.repository=chainguard/falco-no-driver \
    --set image.tag=latest \
    --set driver.kind=modern-bpf \
    --set falcoctl.image.registry=cgr.dev \
    --set falcoctl.image.repository=chainguard/falcoctl \
    --set falcoctl.image.tag=latest \
    --wait falcosecurity/falco
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