<!--monopod:start-->
# tomcat
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/tomcat` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/tomcat/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Tomcat](https://tomcat.apache.org/) is a free and open-source implementation of the Jakarta Servlet, Jakarta Expression Language, and WebSocket technologies.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/tomcat:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

To run the `tomcat` program:

```shell
% docker run cgr.dev/chainguard/tomcat:latest
02-Oct-2023 19:08:45.331 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version name:   Apache Tomcat/10.1.13
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server built:          Sep 20 2023 18:44:35 UTC
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version number: 10.1.13.0
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log OS Name:               Linux
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log OS Version:            6.3.13-linuxkit
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Architecture:          aarch64
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Java Home:             /usr/lib/jvm/java-17-openjdk
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log JVM Version:           17.0.9+7-wolfi-r0
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log JVM Vendor:            wolfi
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log CATALINA_BASE:         /usr/share/tomcat
02-Oct-2023 19:08:45.333 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log CATALINA_HOME:         /usr/share/tomcat
02-Oct-2023 19:08:45.337 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.util.logging.config.file=/usr/local/tomcat/conf/logging.properties
02-Oct-2023 19:08:45.337 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager
02-Oct-2023 19:08:45.337 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djdk.tls.ephemeralDHKeySize=2048
02-Oct-2023 19:08:45.337 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.protocol.handler.pkgs=org.apache.catalina.webresources
02-Oct-2023 19:08:45.337 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Dorg.apache.catalina.security.SecurityListener.UMASK=0027
02-Oct-2023 19:08:45.337 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.lang=ALL-UNNAMED
02-Oct-2023 19:08:45.338 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.io=ALL-UNNAMED
02-Oct-2023 19:08:45.338 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.util=ALL-UNNAMED
02-Oct-2023 19:08:45.338 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.util.concurrent=ALL-UNNAMED
02-Oct-2023 19:08:45.338 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
02-Oct-2023 19:08:45.338 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Dcatalina.base=/usr/local/tomcat
02-Oct-2023 19:08:45.338 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Dcatalina.home=/usr/local/tomcat
02-Oct-2023 19:08:45.338 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.io.tmpdir=/usr/local/tomcat/temp
02-Oct-2023 19:08:45.339 INFO [main] org.apache.catalina.core.AprLifecycleListener.lifecycleEvent The Apache Tomcat Native library which allows using OpenSSL was not found on the java.library.path: [/usr/lib:/usr/java/packages/lib:/usr/lib64:/lib64:/lib:/usr/lib]
02-Oct-2023 19:08:45.461 INFO [main] org.apache.coyote.AbstractProtocol.init Initializing ProtocolHandler ["http-nio-8080"]
02-Oct-2023 19:08:45.473 INFO [main] org.apache.catalina.startup.Catalina.load Server initialization in [223] milliseconds
02-Oct-2023 19:08:45.496 INFO [main] org.apache.catalina.core.StandardService.startInternal Starting service [Catalina]
02-Oct-2023 19:08:45.496 INFO [main] org.apache.catalina.core.StandardEngine.startInternal Starting Servlet engine: [Apache Tomcat/10.1.13]
02-Oct-2023 19:08:45.501 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["http-nio-8080"]
02-Oct-2023 19:08:45.508 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [35] milliseconds
<!--body:end-->
