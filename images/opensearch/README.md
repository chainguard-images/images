<!--monopod:start-->
# opensearch
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/opensearch` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/opensearch/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for opensearch

Minimal image with Opensearch.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/opensearch:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using Opensearch

Chainguard Opensearch images include the `opensearch` package and helper scripts which can be used to start up or configure Opensearch.

The full list of included tools is:

```shell
$ ls /usr/share/opensearch/bin/
docker-entrypoint.sh      opensearch-cli            opensearch-env-from-file  opensearch-node           opensearch-shard
opensearch                opensearch-env            opensearch-keystore       opensearch-plugin         opensearch-upgrade
```

The default entrypoint is set to run the included `docker-entrypoint.sh` script.

To get started:

```shell
$ docker run -it cgr.dev/chainguard/opensearch
[2023-03-24T00:44:00,077][INFO ][o.o.n.Node               ] [6e57776e2bfa] version[2.6.0-SNAPSHOT], pid[1], build[docker/7203a5af21a8a009aece1474446b437a3c674db6/1970-01-01T00:00Z], OS[Linux/5.15.49-linuxkit/aarch64], JVM[wolfi/OpenJDK 64-Bit Server VM/11.0.18-internal/11.0.18-internal+0-wolfi-r1]
[2023-03-24T00:44:00,079][INFO ][o.o.n.Node               ] [6e57776e2bfa] JVM home [/usr/lib/jvm/openjdk-jre], using bundled JDK [false]
[2023-03-24T00:44:00,079][INFO ][o.o.n.Node               ] [6e57776e2bfa] JVM arguments [-Xshare:auto, -Dopensearch.networkaddress.cache.ttl=60, -Dopensearch.networkaddress.cache.negative.ttl=10, -XX:+AlwaysPreTouch, -Xss1m, -Djava.awt.headless=true, -Dfile.encoding=UTF-8, -Djna.nosys=true, -XX:-OmitStackTraceInFastThrow, -Dio.netty.noUnsafe=true, -Dio.netty.noKeySetOptimization=true, -Dio.netty.recycler.maxCapacityPerThread=0, -Dio.netty.allocator.numDirectArenas=0, -Dlog4j.shutdownHookEnabled=false, -Dlog4j2.disable.jmx=true, -Djava.locale.providers=SPI,COMPAT, -Xms1g, -Xmx1g, -XX:+UseG1GC, -XX:G1ReservePercent=25, -XX:InitiatingHeapOccupancyPercent=30, -Djava.io.tmpdir=/tmp/opensearch-3008263594678974238, -XX:+HeapDumpOnOutOfMemoryError, -XX:HeapDumpPath=data, -XX:ErrorFile=logs/hs_err_pid%p.log, -Xlog:gc*,gc+age=trace,safepoint:file=logs/gc.log:utctime,pid,tags:filecount=32,filesize=64m, -Dopensearch.cgroups.hierarchy.override=/, -XX:MaxDirectMemorySize=536870912, -Dopensearch.path.home=/usr/share/opensearch, -Dopensearch.path.conf=/usr/share/opensearch/config, -Dopensearch.distribution.type=docker, -Dopensearch.bundled_jdk=true]
[2023-03-24T00:44:00,079][WARN ][o.o.n.Node               ] [6e57776e2bfa] version [2.6.0-SNAPSHOT] is a pre-release version of OpenSearch and is not suitable for production
[2023-03-24T00:44:00,405][INFO ][o.o.i.r.ReindexPlugin    ] [6e57776e2bfa] ReindexPlugin reloadSPI called
[2023-03-24T00:44:00,407][INFO ][o.o.i.r.ReindexPlugin    ] [6e57776e2bfa] Unable to find any implementation for RemoteReindexExtension
[2023-03-24T00:44:00,415][INFO ][o.o.p.PluginsService     ] [6e57776e2bfa] loaded module [aggs-matrix-stats]
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