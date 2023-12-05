<!--monopod:start-->
# curl
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/curl` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/curl/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal [curl](https://curl.se/) image base containing curl and ca-certificates.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/curl:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The curl image allows you to run ordinary curl commands in CI/CD pipelines and also locally via Docker.

### Docker Setup

To make sure you have the latest image version available, start by running a `docker pull` command:

```shell
docker pull cgr.dev/chainguard/curl
```

Then, run the image with the `--version` flag to make sure it is functional:

```shell
docker run -it --rm cgr.dev/chainguard/curl --version
```
You should get output similar to this:

```shell
$ docker run curl --version
curl 7.87.0 (aarch64-unknown-linux-gnu) libcurl/7.87.0 OpenSSL/3.0.7 zlib/1.2.13 brotli/1.0.9 nghttp2/1.49.0
Release-Date: 2022-12-21
Protocols: dict file ftp ftps gopher gophers http https imap imaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp
Features: alt-svc AsynchDNS brotli HSTS HTTP2 HTTPS-proxy IPv6 Largefile libz NTLM NTLM_WB SSL threadsafe TLS-SRP UnixSockets
```
<!--body:end-->
