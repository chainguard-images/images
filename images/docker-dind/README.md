<!--monopod:start-->
# docker-dind
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/docker-dind` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/docker-dind/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for docker-dind

Chainguard image for Docker in Docker (DinD), allowing you to run Docker within a container.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/docker-dind:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes
The Chainguard Docker Image is comparable to [the official Docker Image from Docker Hub](https://hub.docker.com/_/docker). However, the Chainguard image contains only the minimum set of tools and dependencies needed to function. This means it doesn't include things like a package manager.

## Getting Started

To use the image you can either run in privileged mode after mounting sock path or run the image with --privileged flag
As an example of how you can use this image, run the container in detached mode by passing the `-d` argument and bind the Docker socket:

```shell
docker run --rm -it -d -v /var/run/docker.sock:/var/run/docker.sock --name my-dind $IMAGE_NAME sh
```

Following that, you can interact with the container using `docker exec`:

```shell
docker exec -it my-dind docker info
docker exec -it my-dind docker version
docker exec -it my-dind docker images
docker exec -it my-dind docker run --rm cgr.dev/chainguard/busybox echo "Hello from BusyBox"
```
Another example of how you can use this image, run the container in privileged mode by passing the `--privileged` flag:
```shell
docker run --name my-privileged-dind --rm --privileged -d $IMAGE_NAME
```

Following that, you can interact with the container using `docker exec`:

```shell
docker exec -it my-dind docker info
docker exec -it my-dind docker version
docker exec -it my-dind docker images
docker exec -it my-dind docker run --rm cgr.dev/chainguard/busybox echo "Hello from BusyBox"
```

## Documentation and Resources
- [Docker in Docker usage docs](https://hub.docker.com/_/docker)

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