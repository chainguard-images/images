<!--monopod:start-->
# maven
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/maven` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/maven/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for maven

Minimal image with the Maven build system.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/maven:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._