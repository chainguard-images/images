<!--monopod:start-->
# gcc-glibc
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gcc-glibc` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gcc-glibc/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for gcc-glibc

Minimal GCC (GNU Compiler Collection) image for building C applications compatible with glibc.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/gcc-glibc:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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