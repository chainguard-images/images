<!--monopod:start-->
# rabbitmq
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/rabbitmq` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/rabbitmq/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for rabbitmq

[RabbitMQ](https://github.com/rabbitmq/rabbitmq-server) RabbitMQ is a message broker.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/rabbitmq:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using RabbitMQ

The default RabbitMQ port is 5672.
To run with Docker using default configuration:

```sh
docker run -p 5672:5672 --rm cgr.dev/chainguard/rabbitmq
2023-01-02 00:11:37.199274+00:00 [notice] <0.44.0> Application syslog exited with reason: stopped
2023-01-02 00:11:37.206489+00:00 [notice] <0.229.0> Logging: switching to configured handler(s); following messages may not be visible in this log output

  ##  ##      RabbitMQ 3.11.5
  ##  ##
  ##########  Copyright (c) 2007-2022 VMware, Inc. or its affiliates.
  ######  ##
  ##########  Licensed under the MPL 2.0. Website: https://rabbitmq.com

  Erlang:      25.2 [jit]
  TLS Library: OpenSSL - OpenSSL 3.0.7 1 Nov 2022
  Release series support status: supported

  Doc guides:  https://rabbitmq.com/documentation.html
  Support:     https://rabbitmq.com/contact.html
  Tutorials:   https://rabbitmq.com/getstarted.html
  Monitoring:  https://rabbitmq.com/monitoring.html

  Logs: /var/log/rabbitmq/rabbit@02bee2143fb7.log
        /var/log/rabbitmq/rabbit@02bee2143fb7_upgrade.log
        <stdout>

  Config file(s): (none)

  Starting broker... completed with 0 plugins.
```

## Configuration

RabbitMQ takes three configuration files: the rabbitmq configuration file, the advanced configuration file,
and the environment file.

These can be placed into the image at the following locations, or overridden with the corresponding
environment variables:

```shell
RABBITMQ_CONFIG_FILE=/etc/rabbitmq/rabbitmq.conf
RABBITMQ_ADVANCED_CONFIG_FILE=/etc/rabbitmq/advanced.config
RABBITMQ_CONF_ENV_FILE=/etc/rabbitmq/rabbitmq-env.conf
```

## Users and Directories

By default this image runs as a non-root user named `rabbitmq` with a uid of 65532.

Logs go to `/var/log/rabbitmq/` by default.
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