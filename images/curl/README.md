<!--monopod:start-->
# curl
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/curl` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/curl/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for curl

Minimal [curl](https://curl.se/) image base containing curl and ca-certificates.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/curl:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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

After downloading the image, you can run it with the `--version` flag to verify it's working correctly:

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