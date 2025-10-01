<!--monopod:start-->
# gcc-glibc
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gcc-glibc` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/gcc-glibc/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Minimal GCC (GNU Compiler Collection) image for building C applications compatible with glibc.

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
The gcc-glibc Chainguard image was built to work as a drop-in replacement for the [gcc](https://hub.docker.com/_/gcc) official image from Docker Hub. 

Unlike many other Chainguard images, the gcc-glibc image includes a shell, allowing you to log into the container and run commands interactively. It also runs as the root user by default. Despite these two differences, the image is still designed to be secure and minimal, and does not include a package manager. If you need a package manager, you can use the `-dev` variant of this image.

It's also worth noting that Chainguard's gcc-glibc image sets an entrypoint to `/usr/bin/gcc`, while the official gcc image lands on a shell by default when no arguments are passed to the `docker run` command. You can always use the `--entrypoint` argument with `docker run` to override the entrypoint if needed.

## Getting Started
You can use the gcc-glibc image both to compile and to run C applications that are compatible with the GNU C Library (glibc). Consider the following `hello.c` program:

```c
#include <stdio.h>

int main() {
    printf("Hello World!\n");
    return 0;
}
```

To compile this program using the gcc-glibc Chainguard image, you can use the following command:

```shell
docker run --rm -v ${PWD}:/work cgr.dev/ORGANIZATION/gcc-glibc /work/hello.c -o hello
```

This will create a Linux binary called `hello` in your current folder. If your program has a Makefile, you can instead run `make` by replacing the image's entrypoint:

```shell
docker run --rm -v ${PWD}:/work --entrypoint make cgr.dev/ORGANIZATION/gcc-glibc
```
This will execute the application's Makefile in the container.

### Using the gcc-glibc Image as a Runtime
To run the compiled program using the gcc-glibc image, you can use the following command:

```shell
docker run --rm -v ${PWD}:/work --entrypoint /work/hello cgr.dev/ORGANIZATION/gcc-glibc
```

This will replace the default entrypoint of the image, which is `/usr/bin/gcc`, with the `hello` binary you just compiled. Although this works and is a straightforward way to test your compiled program after  building it, consider using instead the [Chainguard glibc-dynamic image](https://images.chainguard.dev/directory/image/glibc-dynamic/overview) to run your compiled C applications in a slimmer and more production-ready runtime environment for C programs. The [Getting Started with the C/C++ Chainguard Images](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/c/) guide on Chainguard Academy has detailed instructions on how to build multi-stage environments for C programs using both the gcc-glibc and glibc-dynamic images.

### Usage in a Dockerfile

The following Dockerfile builds the example `hello.c` program and sets the entry point to the compiled binary:

```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc:latest

COPY hello.c /work

RUN gcc -o hello hello.c && \
  cp /work/hello /usr/bin/hello 
    
USER 65532

ENTRYPOINT ["/usr/bin/hello"]
```

For production environments, consider using a combination of gcc-glibc and [glibc-dynamic](https://images.chainguard.dev/directory/image/glibc-dynamic/overview) to build a final distroless image containing only what's necessary to run your compiled binary. The following example shows how to create such an image in a multi-stage Dockerfile:

```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc:latest as builder

COPY hello.c /work

RUN gcc -o hello hello.c 

FROM cgr.dev/chainguard/glibc-dynamic:latest

COPY --from=builder /work/hello /usr/bin/

USER 65532

ENTRYPOINT ["/usr/bin/hello"]
```

For more details, check our [Getting Started with the C/C++ Chainguard Images](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/c/) guide on Chainguard Academy.

## Documentation and Resources

- [Chainguard Academy: Choosing an Image for your Compiled Programs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/images-compiled-programs/compiled-programs/)
- [Video: Getting Started with the C/C++ Chainguard Images](https://youtu.be/g7fCIRJ8_pE?feature=shared)
- [Chainguard Academy: glibc vs musl](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/images-compiled-programs/glibc-vs-musl/)
- [Demos: glibc vs musl benchmarks](https://github.com/chainguard-dev/edu-images-demos/tree/main/glibc-vs-musl)

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