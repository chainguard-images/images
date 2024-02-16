<!--monopod:start-->
# zookeeper
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/zookeeper` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/zookeeper/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with Apache Zookeeper. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/zookeeper:latest
```
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
