<!--monopod:start-->
# weaviate
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/weaviate` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/weaviate/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for weaviate

Minimal container image for running the weaviate vector database.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/weaviate:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

This image should be a drop-in replacement for the upstream `weaviate` image.

Note that this image does not include a config file by default, and one is required to start the server.
This can be specified using the `--config-file` paramter.

```
% docker run cgr.dev/chainguard/weaviate --help
Usage:
  weaviate [OPTIONS]

Cloud-native, modular vector search engine

Application Options:
      --scheme=            the listeners to enable, this can be repeated and
                           defaults to the schemes in the swagger spec
      --cleanup-timeout=   grace period for which to wait before killing idle
                           connections (default: 10s)
      --graceful-timeout=  grace period for which to wait before shutting down
                           the server (default: 15s)
      --max-header-size=   controls the maximum number of bytes the server will
                           read parsing the request header's keys and values,
                           including the request line. It does not limit the
                           size of the request body. (default: 1MiB)
      --socket-path=       the unix socket to listen on (default:
                           /var/run/weaviate.sock)
      --host=              the IP to listen on (default: localhost) [$HOST]
      --port=              the port to listen on for insecure connections,
                           defaults to a random value [$PORT]
      --listen-limit=      limit the number of outstanding requests
      --keep-alive=        sets the TCP keep-alive timeouts on accepted
                           connections. It prunes dead TCP connections ( e.g.
                           closing laptop mid-download) (default: 3m)
      --read-timeout=      maximum duration before timing out read of the
                           request (default: 30s)
      --write-timeout=     maximum duration before timing out write of the
                           response (default: 60s)
      --tls-host=          the IP to listen on for tls, when not specified it's
                           the same as --host [$TLS_HOST]
      --tls-port=          the port to listen on for secure connections,
                           defaults to a random value [$TLS_PORT]
      --tls-certificate=   the certificate to use for secure connections
                           [$TLS_CERTIFICATE]
      --tls-key=           the private key to use for secure connections
                           [$TLS_PRIVATE_KEY]
      --tls-ca=            the certificate authority file to be used with
                           mutual tls auth [$TLS_CA_CERTIFICATE]
      --tls-listen-limit=  limit the number of outstanding requests
      --tls-keep-alive=    sets the TCP keep-alive timeouts on accepted
                           connections. It prunes dead TCP connections ( e.g.
                           closing laptop mid-download)
      --tls-read-timeout=  maximum duration before timing out read of the
                           request
      --tls-write-timeout= maximum duration before timing out write of the
                           response

Connector config & MQTT config:
      --config-file=       path to config file (default: ./weaviate.conf.json)

Help Options:
  -h, --help               Show this help message
```

## Helm Deployment

This image is a drop-in replacement for the upstream `weaviate` image, and can be used in the [standard Helm charts](https://github.com/weaviate/weaviate-helm).
To deploy in that helm chart, you can use:

```
$ helm repo add weaviate https://weaviate.github.io/weaviate-helm
$ helm install my-weaviate weaviate/weaviate \
    --set image.registry=cgr.dev \
    --set image.repo=chainguard/weaviate \
    --set image.tag=latest
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