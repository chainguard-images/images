<!--monopod:start-->
# tomcat
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/tomcat` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/tomcat/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for tomcat

[Tomcat](https://tomcat.apache.org/) is a free and open-source implementation of the Jakarta Servlet, Jakarta Expression Language, and WebSocket technologies.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/tomcat:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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