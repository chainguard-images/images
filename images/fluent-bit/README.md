<!--monopod:start-->
# fluent-bit
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/fluent-bit` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/fluent-bit/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for fluent-bit

[Fluent Bit](https://fluentbit.io) is a lightweight and high performance log processor.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/fluent-bit:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using fluent-bit

Run a Fluent Bit instance that will receive messages over TCP port 24224 through the Forward protocol, and send the messages to the STDOUT interface in JSON format every second:

```sh
docker run -p 127.0.0.1:24224:24224 cgr.dev/chainguard/fluent-bit /usr/bin/fluent-bit -i forward -o stdout -p format=json_lines -f 1
```

Now run a separate container that will send a test message. This time the Docker container will use the Fluent Forward Protocol as the logging driver:

```sh
docker run --log-driver=fluentd -t ubuntu echo "Testing a log message"
```

On Fluent Bit container, it will print to stdout something like this:

```sh
Fluent Bit v2.0.8
* Copyright (C) 2015-2022 The Fluent Bit Authors
* Fluent Bit is a CNCF sub-project under the umbrella of Fluentd
* https://fluentbit.io

[2023/01/20 01:37:06] [ info] [fluent bit] version=2.0.8, commit=, pid=1
[2023/01/20 01:37:06] [ info] [storage] ver=1.4.0, type=memory, sync=normal, checksum=off, max_chunks_up=128
[2023/01/20 01:37:06] [ info] [cmetrics] version=0.5.8
[2023/01/20 01:37:06] [ info] [ctraces ] version=0.2.7
[2023/01/20 01:37:06] [ info] [input:forward:forward.0] initializing
[2023/01/20 01:37:06] [ info] [input:forward:forward.0] storage_strategy='memory' (memory only)
[2023/01/20 01:37:06] [ info] [input:forward:forward.0] listening on 0.0.0.0:24224
[2023/01/20 01:37:06] [ info] [sp] stream processor started
[2023/01/20 01:37:06] [ info] [output:stdout:stdout.0] worker #0 started
{"date":1674178633.0,"container_id":"c77d18c7700cc8e552b1f137ec9e6cd922637c733463e38fc97de7d51a95e4e9","container_name":"/nice_morse","source":"stdout","log":"Testing a log message\r"}
```
## Using the fluent-bit Helm Chart

You can deploy fluent-bit as a Helm chart by running the following:

```shell
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update
```

Next, we can install it with the following command:

```shell
helm upgrade --install fluent-bit \
    --set image.repository=cgr.dev/chainguard/fluent-bit \
    --set image.tag=latest \
    --set command="/usr/bin/fluent-bit" \
    fluent/fluent-bit
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