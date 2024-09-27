<!--monopod:start-->
# clickhouse
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/clickhouse` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/clickhouse/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for clickhouse

[Clickhouse](https://clickhouse.com) is the fastest and most resource efficient open-source database for real-time apps and analytics.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/clickhouse:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using Clickhouse

The default Clickhouse listen_host is `127.0.0.1` and port is `8123`.

### start server instance

To run with Docker and allow empty passwords:

```
docker run -d --ulimit nofile=262144:262144 cgr.dev/chainguard/clickhouse:latest
```

By default, ClickHouse will be accessible only via the Docker network. See the networking section below.

By default, starting above server instance will be run as the default user without password.

## Users and Directories

By default, this image runs as a non-root user named `clickhouse` with a uid of `101` and a home directory of `/home/clickhouse`.

### Volumes

Typically you may want to mount the following folders inside your container to achieve persistency:

* /var/lib/clickhouse/ - main folder where ClickHouse stores the data
* /var/log/clickhouse-server/ - logs

```
docker run -d \
    -v $(realpath ./ch_data):/var/lib/clickhouse/ \
    -v $(realpath ./ch_logs):/var/log/clickhouse-server/ \
    --ulimit nofile=262144:262144 cgr.dev/chainguard/clickhouse:latest
```

You may also want to mount:

* /etc/clickhouse-server/config.d/*.xml - files with server configuration adjustmenets
* /etc/clickhouse-server/users.d/*.xml - files with user settings adjustmenets
* /docker-entrypoint-initdb.d/ - folder with database initialization scripts (see below).


## Docker Compose Example

This `docker-compose.yaml` sets up a Clickhouse database with a default database and user.

```yaml
version: "3.7"
services:
  clickhouse:
    image: cgr.dev/chainguard/clickhouse:latest
    restart: unless-stopped
    entrypoint: /usr/bin/clickhouse-server -- --listen_host 0.0.0.0
    working_dir: /home/clickhouse
    ports:
      - 8123:8123
    volumes:
      - ./data/clickhouse:/var/lib/clickhouse
      - ./logs/clickhouse:/var/log/clickhouse-server
    networks:
      - wolfi

networks:
  wolfi:
    driver: bridge
```

## Advanced Configuration

Please refer to [Clickhouse's documentation](https://clickhouse.com/docs/en/operations/configuration-files#configuration_files) for more advanced configuration.

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