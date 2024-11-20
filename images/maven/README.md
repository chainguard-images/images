<!--monopod:start-->
# maven
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/maven` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/maven/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for maven

Minimal image with the Maven build system.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/maven:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The Maven Chainguard image was built to work as a drop-in replacement for the official [Maven image on Docker Hub](https://hub.docker.com/_/maven). Like most of Chainguard's images, the Maven image does not operate as the root user and includes only the minimum packages needed to function.

Chainguard Maven images come with different versions of OpenJDK. This means you will need to ensure that you choose the correct image tag for your application needs.

## Getting Started

To illustrate how you can use Chainguard's Maven image, you will need a Java application for the Maven image to build. This overview will use a Spring Boot example application found in [this GitHub repository](https://github.com/chainguard-dev/learning-labs-java).

Clone the repository to your local machine and navigate into the project directory:

```shell
git clone https://github.com/chainguard-dev/learning-labs-java.git
cd learning-labs-java/
```

The example's Dockerfile uses the default Maven image from Docker Hub. Overwrite this file with the following command to instead use the Chainguard Maven Image: 

```shell
cat > Dockerfile <<EOF
FROM cgr.dev/chainguard/maven

WORKDIR /work

COPY src/ src/
COPY pom.xml pom.xml

RUN mvn clean package
RUN REPOSITORY=$(mvn help:evaluate -Dexpression=settings.localRepository -q -DforceStdout) && rm -rf ${REPOSITORY}

WORKDIR /app

RUN cp /work/target/java-demo-app-1.0.0.jar .

ENTRYPOINT ["java", "-jar", "java-demo-app-1.0.0.jar"]
EOF
```

Then build an image using this Dockerfile with the following command:

```shell
docker build -t maven-app .
```

This command tags the image as `maven-app`. Run this image:

```shell
docker run --rm -p 8080:8080 maven-app
```

The app should now be running and you can interact with it by accessing it at [`localhost:8080/hello`](http://localhost:8080/hello), either in your browser or with `curl`, as in the following example:

```shell
curl localhost:8080/hello
```
```
Hello, World! I love Chainguard!
```

This shows that the application is working as expected. You can stop the container by pressing `CTRL + C` in the terminal where it's running.


### Using Chainguard's Maven image in a multi-stage build
‍
The image built in the previous example still includes build tooling and source code that aren't needed in the production image. Using a multi-stage build can reduce the number of dependencies.

To try this out, create a new Dockerfile named `Dockerfile.multi-stage`:

```shell
cat > Dockerfile.multi-stage <<EOF
FROM cgr.dev/chainguard/maven AS builder

WORKDIR /work

COPY src/ src/
COPY pom.xml pom.xml

RUN mvn clean package
RUN REPOSITORY=$(mvn help:evaluate -Dexpression=settings.localRepository -q -DforceStdout) && rm -rf ${REPOSITORY}

FROM cgr.dev/chainguard/jre AS runner

WORKDIR /app

COPY --from=builder /work/target/java-demo-app-1.0.0.jar .

ENTRYPOINT ["java", "-jar", "java-demo-app-1.0.0.jar"]
EOF
```

Note that there are two `FROM` lines, the first one creates the `builder` image much as before and the second (named `runner`) copies the built JAR from the builder step into the smaller `cgr.dev/chainguard/jre` image. The result is a container image that only contains the JRE and the built application.

Using this multi-stage Dockerfile, build a new image:

```shell
docker build -f Dockerfile.multi-stage -t maven-app-multi-stage .
```

This command tags the image as `maven-app-multi-stage`. Run this image:

```shell
docker run --rm -p 8080:8080 maven-app-multi-stage
```

Again, the application will be accessible at [localhost:8080/hello](http://localhost:8080/hello):

```shell
curl localhost:8080/hello
```
```
Hello, World! I love Chainguard!
```

Once again, press `CTRL + C` to stop the running container.

## Documentation and Resources

* [Learning Lab: Chainguard's Java Container Image](https://www.youtube.com/watch?v=8v8xlFnRHfs)
* [Chainguard Blog: Building minimal and low CVE images for Java](https://www.chainguard.dev/unchained/building-minimal-and-low-cve-images-for-java)
* [Video: Building Minimal Images for Applications with Runtimes](https://edu.chainguard.dev/chainguard/chainguard-images/videos/minimal-runtime-images/)
* [Video: How to Migrate a Java Application to Chainguard Images](https://edu.chainguard.dev/chainguard/chainguard-images/videos/java-images/)
* [Vulnerability Comparison: maven](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/maven/)
* [Apache Maven Project Site](https://maven.apache.org/)
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