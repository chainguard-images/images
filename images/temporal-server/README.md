<!--monopod:start-->
# temporal-server
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/temporal-server` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/temporal-server/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for temporal-server

Minimal image for [Temporal](https://docs.temporal.io/), a durable execution platform that handles intermittent failures and retries failed operations

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/temporal-server:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

The default entrypoint for this image is `/etc/temporal/entrypoint.sh`

To test:

```shell
$ docker run cgr.dev/chainguard/temporal-server:latest start --config <config dir path relative to root (default: "config")>

USAGE:
   temporal-server [global options] command [command options]  

VERSION:
   1.22.0

COMMANDS:
   start    Start Temporal server
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --root value, -r value    root directory of execution environment (default: ".") [$TEMPORAL_ROOT]
   --config value, -c value  config dir path relative to root (default: "config") [$TEMPORAL_CONFIG_DIR]
   --env value, -e value     runtime environment (default: "development") [$TEMPORAL_ENVIRONMENT]
   --zone value, --az value  availability zone [$TEMPORAL_AVAILABILITY_ZONE, $TEMPORAL_AVAILABILTY_ZONE]
   --allow-no-auth           allow no authorizer (default: false) [$TEMPORAL_ALLOW_NO_AUTH]
   --help, -h                show help (default: false)
   --version, -v             print the version (default: false)
```

Notes: 

* Here's the docker compose repo link for further reference on how this image can run https://github.com/temporalio/docker-compose
* For Helm Chart working, here's the reference: https://github.com/temporalio/helm-charts/tree/master#install-temporal-with-helm-chart 
TLDR, for a miminal helm installation:

```
helm -n temporaltest install \
    --set server.replicaCount=1 \
    --namespace temporaltest \
    --create-namespace \
    --set cassandra.config.cluster_size=1 \
    --set prometheus.enabled=false \
    --set grafana.enabled=false \
    --set elasticsearch.enabled=false \
    --set server.image.repository=cgr.dev/chainguard/temporal-server \
    --set server.image.tag=latest \
    temporaltest . --timeout 15m
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