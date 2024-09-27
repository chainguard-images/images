<!--monopod:start-->
# zookeeper
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/zookeeper` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/zookeeper/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for zookeeper

Minimal image with Apache Zookeeper.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/zookeeper:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using Zookeeper

To run Zookeeper image with the sample configuration, use:

```shell
$ docker container run -d -e ZOO_ENABLE_AUTH=no -e ALLOW_ANONYMOUS_LOGIN=yes -e ZOO_4LW_COMMANDS_WHITELIST='*' -p 2181:2181 cgr.dev/chainguard/zookeeper:latest
ZooKeeper JMX enabled by default
Using config: /usr/share/java/zookeeper/bin/../conf/zoo_sample.cfg
2023-03-12 20:38:22,340 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@177] - Reading configuration from: /usr/share/java/zookeeper/bin/../conf/zoo_sample.cfg
2023-03-12 20:38:22,341 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@440] - clientPortAddress is 0.0.0.0:2181
2023-03-12 20:38:22,342 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@444] - secureClientPort is not set
2023-03-12 20:38:22,342 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@460] - observerMasterPort is not set
2023-03-12 20:38:22,342 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@477] - metricsProvider.className is org.apache.zookeeper.metrics.impl.DefaultMetricsProvider
2023-03-12 20:38:22,343 [myid:] - INFO  [main:o.a.z.s.DatadirCleanupManager@78] - autopurge.snapRetainCount set to 3
2023-03-12 20:38:22,343 [myid:] - INFO  [main:o.a.z.s.DatadirCleanupManager@79] - autopurge.purgeInterval set to 0
2023-03-12 20:38:22,343 [myid:] - INFO  [main:o.a.z.s.DatadirCleanupManager@101] - Purge task is not scheduled.
2023-03-12 20:38:22,343 [myid:] - WARN  [main:o.a.z.s.q.QuorumPeerMain@139] - Either no config or no quorum defined in config, running in standalone mode
2023-03-12 20:38:22,344 [myid:] - INFO  [main:o.a.z.j.ManagedUtil@46] - Log4j 1.2 jmx support not found; jmx disabled.
2023-03-12 20:38:22,344 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@177] - Reading configuration from: /usr/share/java/zookeeper/bin/../conf/zoo_sample.cfg
2023-03-12 20:38:22,344 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@440] - clientPortAddress is 0.0.0.0:2181
2023-03-12 20:38:22,344 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@444] - secureClientPort is not set
2023-03-12 20:38:22,344 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@460] - observerMasterPort is not set
2023-03-12 20:38:22,344 [myid:] - INFO  [main:o.a.z.s.q.QuorumPeerConfig@477] - metricsProvider.className is org.apache.zookeeper.metrics.impl.DefaultMetricsProvider
2023-03-12 20:38:22,344 [myid:] - INFO  [main:o.a.z.s.ZooKeeperServerMain@123] - Starting server
2023-03-12 20:38:22,350 [myid:] - INFO  [main:o.a.z.s.ServerMetrics@64] - ServerMetrics initialized with provider org.apache.zookeeper.metrics.impl.DefaultMetricsProvider@1040be71
2023-03-12 20:38:22,351 [myid:] - INFO  [main:o.a.z.s.a.DigestAuthenticationProvider@47] - ACL digest algorithm is: SHA1
2023-03-12 20:38:22,351 [myid:] - INFO  [main:o.a.z.s.a.DigestAuthenticationProvider@61] - zookeeper.DigestAuthenticationProvider.enabled = true
2023-03-12 20:38:22,352 [myid:] - INFO  [main:o.a.z.s.p.FileTxnSnapLog@124] - zookeeper.snapshot.trust.empty : false
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -   ______                  _
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -  |___  /                 | |
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -     / /    ___     ___   | | __   ___    ___   _ __     ___   _ __
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -    / /    / _ \   / _ \  | |/ /  / _ \  / _ \ | '_ \   / _ \ | '__|
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -   / /__  | (_) | | (_) | |   <  |  __/ |  __/ | |_) | |  __/ | |
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -  /_____|  \___/   \___/  |_|\_\  \___|  \___| | .__/   \___| |_|
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -                                               | |
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -                                               |_|
2023-03-12 20:38:22,356 [myid:] - INFO  [main:o.a.z.ZookeeperBanner@42] -
2023-03-12 20:38:22,357 [myid:] - INFO  [main:o.a.z.Environment@98] - Server environment:zookeeper.version=3.8.1-74db005175a4ec545697012f9069cb9dcc8cdda7, built on 2023-03-12 20:32 UTC
2023-03-12 20:38:22,357 [myid:] - INFO  [main:o.a.z.Environment@98] - Server environment:host.name=f0739f928721
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