<!--monopod:start-->
# glibc-dynamic
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/glibc-dynamic` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/glibc-dynamic/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for glibc-dynamic

Base image with just enough to run arbitrary glibc binaries.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/glibc-dynamic:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes
This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`. Unlike Chainguard's standard `glibc-dynamic` container image, the `glibc-dynamic` image also includes `libstdc++`, the GNU C++ standard library implementation.

You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.

## Getting Started

To illustrate how you can use Chainguard's `glibc-dynamic` container image, start by creating the following Go program:

```shell
cat > main.go <<EOF
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.Get("http://www.google.com")
	fmt.Println("Hello, world!")
}
EOF
```

This is a `Hello, world!` program, but it includes the line `http.Get("http://www.google.com")` which will require glibc.

Next, create a Dockerfile that uses the Chainguard `glibc-dynamic` container as a base image:

```shell
cat > Dockerfile <<EOF
FROM cgr.dev/chainguard/go AS builder
ADD main.go .
RUN CGO_ENABLED=1 go build -o /tmp/foo main.go

# Use this image as a base image.
FROM cgr.dev/chainguard/glibc-dynamic
COPY --from=builder /tmp/foo /foo
ENTRYPOINT ["/foo"]
EOF
```

Using this Dockerfile, build an image:

```shell
docker build -t glibc-example .
```

Then run the newly-built image:

```shell
docker run --rm glibc-example
```

This will return the following output, indicating the program was run successfully and the `glibc-dynamic` base image worked as expected:

```
Hello, world!
```

## Documentation and Resources

* [glibc Project Website](https://sourceware.org/glibc)
* [Chainguard Academy: glibc vs. musl](https://edu.chainguard.dev/chainguard/chainguard-images/about/images-compiled-programs/glibc-vs-musl/#python-builds)
<!--body:end-->

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