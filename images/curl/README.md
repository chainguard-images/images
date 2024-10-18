<!--monopod:start-->
# curl
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/curl` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/curl/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for curl

Minimal [curl](https://curl.se/) image base containing curl and ca-certificates.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/curl:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The Chainguard curl image is meant to serve as a drop-in replacement for the [official curl image from Docker Hub](https://hub.docker.com/r/curlimages/curl). Like most other Chainguard Images, the cURL image has few-to-zero CVEs and does not run as the root user.


## Getting Started

The Chainguard curl Image allows you to run ordinary `curl` commands in CI/CD pipelines as well as locally with Docker.

Be aware that you can always pull the latest version of the Image available, by downloading it from the public `cgr.dev/chainguard/curl` repository:

```shell
docker pull cgr.dev/chainguard/curl:latest
```

After downloading the image, you can run it the image with the `--version` flag to make sure the Image is functional:

```shell
docker run -it --rm cgr.dev/chainguard/curl --version
```

This will return output similar to the following:

```shell
curl 8.9.0 (x86_64-pc-linux-gnu) libcurl/8.9.0-DEV rustls-ffi/0.13.0/rustls/0.23.4 zlib/1.3.1 brotli/1.1.0 libpsl/0.21.5 nghttp2/1.62.1
Release-Date: 2024-07-24
Protocols: dict file ftp ftps gopher gophers http https imap imaps ipfs ipns mqtt pop3 pop3s rtsp smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli HSTS HTTP2 HTTPS-proxy IPv6 Largefile libz PSL SSL threadsafe UnixSockets
```

You can also run it as you would any other `curl` command. The following example runs `curl` on the URL `cheat.sh/curl`. `cheat.sh` is a site that hosts simplified documentation for a number of command-line utilities:

```shell
docker run -it --rm cgr.dev/chainguard/curl cheat.sh/curl
```

## Documentation and Resources

* (Chainguard Academy) [Vulnerability Comparison: curl](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/curl/)
* (Blog post) [Chainguard’s response to CVE-2023-38545 and CVE-2023-38546 in curl](https://www.chainguard.dev/unchained/chainguards-response-to-cve-2023-38545-and-cve-2023-38546-in-curl) 
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