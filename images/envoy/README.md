<!--monopod:start-->
# envoy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/envoy` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/envoy/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for envoy

[Envoy](https://www.envoyproxy.io/) Cloud-native high-performance edge/middle/service proxy

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/envoy:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The Chainguard Envoy image is meant to serve as a drop-in replacement for the following alternatives:

* `bitnami/envoy:latest`
* `envoyproxy/envoy:v1.25-latest`
* `rapidfort/envoy:1.24`
* `envoyproxy/envoy:latest`

Like most of Chainguard's images, the Envoy image does not operate as the root user and includes only the minimum packages needed to function.

## Getting Started

The Chainguard Envoy image comes with a default configuration stored at `/etc/envoy/envoy.yaml`. To run the image with Docker using this configuration you could run a command like the following:

```sh
docker run -p10000:10000 -p 9901:9901 cgr.dev/chainguard/envoy --config-path /etc/envoy/envoy.yaml
```

The `-p` options in this example connect network ports from your local machine into the container, allowing you to see Envoy in action by visiting `localhost:10000` or `localhost:9901` in your browser. The default configuration will proxy port `10000` to [envoyproxy.io](http://envoyproxy.io) and port `9901` to the Envoy management port.

You can also run the image with a customized Envoy configuration. To do this, you'll need to [bind mount](https://docs.docker.com/engine/storage/bind-mounts/) your local configuration file into the envoy container:

```sh
docker run -p10000:10000 -p 9901:9901 -v $PWD/config.yaml:/etc/envoy cgr.dev/chainguard/envoy --config-path /etc/envoy/config.yaml
```

This example creates a bind mount so that Envoy is running with a local configuration file named `config.yaml`.

You can refer to the [overview in the envoy project's official documentation](https://www.envoyproxy.io/docs/envoy/latest/configuration/overview/overview) for more information on working with custom configurations.
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