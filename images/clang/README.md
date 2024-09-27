<!--monopod:start-->
# clang
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/clang` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/clang/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for clang

[Clang](https://clang.llvm.org) is a compiler front end for the C, C++, Objective-C, and Objective-C++ programming languages, as well as the OpenMP, OpenCL, RenderScript, CUDA, SYCL, and HIP frameworks

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/clang:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->


## Use It!

To illustrate working with the Clang Chainguard Image, this section outlines how you can use it to compile a "Hello World!" program written in C. 

To begin, run the following command to create a file named `hello.c` to hold the C code.

```shell
cat > /tmp/hello.c <<EOF
#include <stdio.h>

int main() {
    printf("Hello World!\n");
    return 0;
}
EOF
```

To simplify cleanup, this command places the file in the `/tmp` temporary directory. 

Next, run the following `docker` command. This will mount the contents of your local `/tmp` directory (including the `hello.c` file) into the container's `work` directory. Once there, Clang will compile the C code into an executable program named `hello`.

```shell
docker run --rm -v /tmp:/work cgr.dev/chainguard/clang:latest hello.c -o /work/hello
```

The `hello` program will be stored back in your local `/tmp` directory. You can test that everything worked correctly by executing this program.

```shell
/tmp/hello
```
```
Hello World!
```

Be aware that, depending on your local machine's operating system, you may not be able to execute this file directly like this. This may be because the program is built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview/). This creates an executable in the Executable and Linkable Format, the standard file format for Linux executables. Other systems might expect a different format; for example, this executable can't run directly on MacOS systems, which instead expect the Mach-O format. It could also be that your machine's `/tmp` directory was mounted with the `noexec` option, preventing anything stored in that directory from being executed.

If you receive an error when trying to run the `hello` program, you can try using another Wolfi-based image to execute it, like so. 

```shell
docker run --rm -v /tmp:/work cgr.dev/chainguard/bash /work/hello
```
```
. . .
Hello World!
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