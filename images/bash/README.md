<!--monopod:start-->
# bash
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/bash` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/bash/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for bash

Container image with only Bash and libc. Suitable for running any small scripts or binaries that need Bash instead of the BusyBox shell.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/bash:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The Chainguard Bash image is meant to serve as a drop-in replacement for the official Bash image from Docker Hub. One notable difference between the Docker Hub image and Chainguard's Bash image is the location where `bash` is installed in the container. The Bash Image from Docker Hub has `bash` installed at `/usr/local/bin/bash` while Chainguard's has it installed at the standard `/bin/bash`.

Like most of Chainguard's images, the Bash image does not operate as the root user and includes only the minimum packages needed to function. 

## Getting Started

To open up an interactive shell in the Bash Image you could run a command like the following:

```sh
docker run -it cgr.dev/chainguard/bash:latest /bin/bash
```

To test scripts from your local machine on the Bash image, you can use a [bind mount](https://docs.docker.com/engine/storage/bind-mounts/). The following example references a local script named `local-script.sh`, binds it to the container while renaming it `container-script.sh`, and then runs the script:

```sh
docker run -v /path/to/local-script.sh:/container-script.sh cgr.dev/chainguard/bash:latest /container-script.sh
```

You can also test scripts on the Bash image using a Dockerfile. The following example Dockerfile references a Bash script named `test-script.sh`:

```
FROM cgr.dev/chainguard/bash:latest

COPY test-script.sh /

CMD ["bash", "/test-script.sh"]
```

You could then build an image based off this Dockerfile:

```sh
docker build -t my-bash-app .
```

And then run the new image to test the script:

```sh
docker run -it --rm --name my-running-app my-bash-app
```

## Documentation and Resources

* [Vulnerability Comparison: bash](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/bash/)
* (Tutorial) [An Introduction to Shell Scripting](https://www.digitalocean.com/community/tutorial-series/an-introduction-to-shell-scripting)
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