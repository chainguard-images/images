<!--monopod:start-->
# gradle
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gradle` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gradle/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for gradle

Chainguard Image with [Gradle](https://gradle.org/), an open source build system for Java, Android, and Kotlin.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/gradle:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard's Gradle image is comparable to the [official Gradle image on Docker Hub](https://hub.docker.com/_/gradle). Like most other Chainguard images, the Gradle image has few-to-zero CVEs and does not run as the root user. Additionally, the Chainguard Gradle image's default entrypoint is `/usr/bin/gradle`. 

## Getting Started

Chainguard Gradle images come with different versions of OpenJDK; ensure you choose the correct image tag for your application needs.

> [!NOTE]
> If you are running Docker on Mac M1 you may experience intermittent container high CPU and container / JVM crashes.  There have been [reports](https://github.com/metanorma/metanorma-docker/issues/126) of this behavior, which is known to also affect non-Chainguard images. It is expected that using ARM based images, which are in development for Chainguard images, will address the problem.  When running the examples below you might experience Gradle builds hanging.  If you do, you can `docker ps` and `docker kill $PID` and retry.

To use the Chainguard Gradle image with Docker, run commands that follow this syntax:

```shell
docker run cgr.dev/chainguard/gradle:latest-dev <gradle-task>
```

For example, to run an existing project you have on your local machine, you could run a command like the following:

```shell
docker run -v "${PWD}":/home/build/project -w /home/build/project cgr.dev/chainguard/gradle:latest run
```

To show the Gradle image building and running a sample application, we will use the `latest-dev` variant of the image, which includes a shell.

First, run the image with the `-it` and `entrypoint=/bin/sh` arguments to access the shell:

```shell
docker run -it --entrypoint=/bin/sh cgr.dev/chainguard/gradle:latest-dev
```

From within the container, run the `init` task to build a `Hello World!` example application:

```
gradle init --type java-application --use-defaults
```

This example specifies that the `init` task should build a Java application with the default settings.

```
. . .

BUILD SUCCESSFUL in 3s
```

Then, use the `run` task to run the newly built application:

```
gradle run
```
```
. . .

> Task :app:run
Hello World!
```


## Documentation and Resources

* [Gradle User Manual](https://docs.gradle.org/current/userguide/userguide.html)
* [Gradle Build Tool GitHub Repository](https://github.com/gradle/gradle)
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