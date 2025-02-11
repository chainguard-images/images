<!--monopod:start-->
# haproxy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/haproxy` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/haproxy/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for haproxy

A minimal [haproxy](https://www.haproxy.org/) base image rebuilt every night from source.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/haproxy:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard’s HAProxy image is a minimal, Wolfi-based container image. It comes in two variants: a `-slim` version that only contains the `haproxy` binary, as well as a regular version that contains a `docker-entrypoint.sh` script that is compatible with the external `docker-library/haproxy` image for use with Helm charts or established Docker based deployments.

## Getting Started

Similar to the `docker-library/haproxy` image, this image does not come with any default configuration.

Please refer to [upstream's excellent (and comprehensive) documentation](https://docs.haproxy.org/) on the subject of configuring HAProxy for your needs.

Let say you have a `haproxy.cfg` config file is current working directory. To test that configuration file, you can run the following command

```
docker run -it --rm -v "$(pwd):/etc/haproxy" --name haproxy-syntax-check cgr.dev/ORGANIZATION/haproxy haproxy -c -f /etc/haproxy/haproxy.cfg
```

In order for the container to work, you need to mount your custom `haproxy.cfg` file in the container. The following example runs HAProxy with a custom configuration file:

```
docker run -it --rm -v "$(pwd):/etc/haproxy" cgr.dev/ORGANIZATION/haproxy haproxy -f /etc/haproxy/haproxy.cfg
```

### Helm install

When installing in Kubernetes, `securityContexts` that drop `[ "ALL" ]` capabilities interfere with the `setcap` privileged `haproxy`. In order to support Kubernetes based installs which default to dropping `ALL` capabilities, the necessary modifications must be made to add back `NET_ADMIN` capabilities.

For example, in the `ha-redis` chart used by `argocd`, the `values.yaml` becomes:

```yaml
# values.yaml
haproxy:
  enabled: true
  containerSecurityContext:
    capabilities:
      add:
        - NET_BIND_SERVICE
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