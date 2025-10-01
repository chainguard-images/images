<!--monopod:start-->
# gradle
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gradle` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/gradle/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Chainguard Image with [Gradle](https://gradle.org/), an open source build system for Java, Android, and Kotlin.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._