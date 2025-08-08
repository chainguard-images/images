<!--monopod:start-->
# docker-dind
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/docker-dind` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/docker-dind/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for docker-dind

Chainguard image for Docker in Docker (DinD), allowing you to run Docker within a container.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/docker-dind:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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

## Get this image as a Chainguard VM

This image is also available as a Chainguard VM, available to deploy on Amazon AWS EC2, Google Cloud Compute Engine, Microsoft Azure and On-Prem through VMware, KVM and QEMU virtualization. Complete our [registration form](https://get.chainguard.dev/vmearlyaccesswaitlist?utm_source=readmes) to get access to Chainguard VMs and try it out for yourself.

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._