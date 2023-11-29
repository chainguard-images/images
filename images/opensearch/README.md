<!--monopod:start-->
# opensearch
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/opensearch` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/opensearch/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with Opensearch. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/opensearch:latest
```
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
