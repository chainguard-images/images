<!--monopod:start-->
# solr
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/solr` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/solr/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[solr](https://github.com/apache/solr) Solr is the popular, blazing fast open source search platform for all your enterprise, e-commerce, and analytics needs, built on Apache Lucene.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/solr:latest
```
<!--getting:end-->

<!--body:start-->
## Using Solr

This image should be a drop-in replacement for the `slim` variant of the upstream image.
Documentation is available there: https://hub.docker.com/_/solr

You can run it locally with:

```shell
$ docker run -p 8983:8983 cgr.dev/chainguard/solr
Starting Solr
Java 17 detected. Enabled workaround for SOLR-16463
[0.002s][warning][pagesize] UseLargePages disabled, no large pages configured and available on the system.
CompileCommand: exclude com/github/benmanes/caffeine/cache/BoundedLocalCache.put bool exclude = true
WARNING: A command line option has enabled the Security Manager
WARNING: The Security Manager is deprecated and will be removed in a future release
2023-11-23 17:22:03.082 INFO  (main) [] o.e.j.s.Server jetty-10.0.17; built: 2023-10-09T18:22:21.150Z; git: af15f12297adf5c5083e1f2f8f4c5974438bca25; jvm 17.0.10+1-wolfi-r0
2023-11-23 17:22:03.346 WARN  (main) [] o.e.j.u.DeprecationWarning Using @Deprecated Class org.eclipse.jetty.servlet.listener.ELContextCleaner
2023-11-23 17:22:03.362 INFO  (main) [] o.a.s.s.CoreContainerProvider Using logger factory org.apache.logging.slf4j.Log4jLoggerFactory
2023-11-23 17:22:03.366 INFO  (main) [] o.a.s.s.CoreContainerProvider  ___      _       Welcome to Apache Solr? version 9.4.0-SNAPSHOT 71e101bb37497f730078d9afe1991b60d10bfe96 [snapshot build, details omitted]
2023-11-23 17:22:03.367 INFO  (main) [] o.a.s.s.CoreContainerProvider / __| ___| |_ _   Starting in standalone mode on port 8983
2023-11-23 17:22:03.367 INFO  (main) [] o.a.s.s.CoreContainerProvider \__ \/ _ \ | '_|  Install dir: /usr/share/java/solr
2023-11-23 17:22:03.367 INFO  (main) [] o.a.s.s.CoreContainerProvider |___/\___/_|_|    Start time: 2023-11-23T17:22:03.367155177Z
2023-11-23 17:22:03.368 INFO  (main) [] o.a.s.s.CoreContainerProvider Solr started with "-XX:+CrashOnOutOfMemoryError" that will crash on any OutOfMemoryError exception. The cause of the OOME will be logged in the crash file at the following path: /var/solr/logs/jvm_crash_12.log
2023-11-23 17:22:03.386 INFO  (main) [] o.a.s.s.CoreContainerProvider Solr Home: /var/solr/data (source: system property: solr.solr.home)
2023-11-23 17:22:03.399 INFO  (main) [] o.a.s.c.SolrXmlConfig solr.xml not found in SOLR_HOME, using built-in default
2023-11-23 17:22:03.399 INFO  (main) [] o.a.s.c.SolrXmlConfig Loading solr.xml from /usr/share/java/solr/server/solr/solr.xml
2023-11-23 17:22:03.451 INFO  (main) [] o.a.s.c.SolrResourceLoader Added 1 libs to classloader, from paths: [/usr/share/java/solr/lib]
2023-11-23 17:22:04.035 INFO  (main) [] o.a.s.u.t.SimplePropagator Always-on trace id generation enabled.
2023-11-23 17:22:04.268 WARN  (main) [] o.a.s.u.StartupLoggingUtils Jetty request logging enabled. Will retain logs for last 3 days. See chapter "Configuring Logging" in reference guide for how to configure.
2023-11-23 17:22:04.270 WARN  (main) [] o.a.s.c.CoreContainer Not all security plugins configured!  authentication=disabled authorization=disabled.  Solr is only as secure as you make it. Consider configuring authentication/authorization before exposing Solr to users internal or external.  See https://s.apache.org/solrsecurity for more info
2023-11-23 17:22:04.458 INFO  (main) [] o.a.s.c.CorePropertiesLocator Found 0 core definitions underneath /var/solr/data
2023-11-23 17:22:04.582 WARN  (main) [] o.g.j.m.i.MessagingBinders A class javax.activation.DataSource for a default provider MessageBodyWriter<javax.activation.DataSource> was not found. The provider is not available.
2023-11-23 17:22:04.803 INFO  (main) [] o.a.s.j.SolrRequestAuthorizer Creating a new SolrRequestAuthorizer
2023-11-23 17:22:04.903 INFO  (main) [] o.e.j.s.h.ContextHandler Started o.e.j.w.WebAppContext@3aee3976{solr-jetty-context.xml,/solr,file:///usr/share/java/solr/server/solr-webapp/webapp/,AVAILABLE}{/usr/share/java/solr/server/solr-webapp/webapp}
2023-11-23 17:22:04.921 INFO  (main) [] o.e.j.s.RequestLogWriter Opened /var/solr/logs/2023_11_23.request.log
2023-11-23 17:22:04.931 INFO  (main) [] o.e.j.s.AbstractConnector Started ServerConnector@556d0826{HTTP/1.1, (http/1.1, h2c)}{0.0.0.0:8983}
2023-11-23 17:22:04.932 INFO  (main) [] o.e.j.s.Server Started Server@2b491fee{STARTING}[10.0.17,sto=0] @3216ms
```

The admin console should then be available in your browser at [http://localhost:8983](http://localhost:8983).
<!--body:end-->
