<!--monopod:start-->
# REPO_NAME
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/REPO_NAME` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/REPO_NAME/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Container image with only Bash and libc. Suitable for running any small scripts or binaries that need Bash instead of the BusyBox shell.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._