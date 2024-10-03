<!--monopod:start-->
# jdk
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/jdk` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/jdk/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for jdk

Minimalist Wolfi-based Java JDK image using using [OpenJDK](https://openjdk.org/projects/jdk/).  Used for compiling Java applications.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/jdk:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Like most available alternatives, Chainguard's JDK image is built directly from the [OpenJDK project](https://openjdk.org/).

The main differences between Chainguard's JDK image and other options are its enhanced security features. These include the fact that the Chainguard JDK image has few-to-zero CVEs and that it does not run as the root user. 

## Getting Started

A JDK is the standard development system for a Java application. It is used for compiling and packaging Java applications, which are then run on a JRE.

### Compiling a Minimal Java Application Example

This section outlines how you can build a Java application with the Chainguard JDK Image.

Start by creating a sample Java class named `HelloWolfi.java`:

```sh
cat >HelloWolfi.java <<EOL
class HelloWolfi
{
    public static void main(String args[])
    {
        System.out.println("Hello Wolfi users!");
    }
}
EOL
```

Then create a multistage Dockerfile, adding the Java class you just created:

```sh
cat >Dockerfile <<EOL
FROM cgr.dev/chainguard/jdk

COPY HelloWolfi.java /home/build/
RUN javac HelloWolfi.java

FROM cgr.dev/chainguard/jre

COPY --from=0 /home/build/HelloWolfi.class /app/
CMD ["HelloWolfi"]
EOL
```

Following that, you can build the image:

```sh
docker build -t my-java-app .
```

Note that this example tags the image with `my-java-app`. You can now run the image by referencing this tag, as in the following command:

```sh
docker run my-java-app
```
```
Hello Wolfi users!
```

### Using the Chainguard JDK image in a Jenkins Pipeline

Using a Chainguard image as part of a CI/CD system like Jenkins might also be a useful option. With the Jenkins Docker agent, you can have various steps using different Chainguard images. The following is an example using the Chainguard JDK image as part of a Jenkins pipeline:

```
pipeline {
    agent {
        docker { image 'cgr.dev/chainguard/jdk' }
    }
    stages {
        stage('Test') {
            steps {
                # Use javac, jdeps, jlink, ...
                sh 'javac -version'
            }
        }
    }
}
```

For a full reference how to use various images in a Jenkins pipeline, please refer to the [Jenkins documentation](https://www.jenkins.io/doc/book/pipeline/docker/).

### Using the Chainguard JDK to create a custom JRE

A less common, but powerful, use case for the JDK image is creating an optimized custom JRE for your Java application. This involves using `jdeps` to produce the information about the Java modules being used and subsequently using `jlink` to analyze your application to eliminate all module code not being used by your application. This can create a drastically smaller JRE for a particular application.

Keep in mind that a JRE produced this way is a fit-for-purpose JRE, and is not broadly usable. 

Our [`jlink` Springboot Demo](https://github.com/chainguard-dev/jlink-springboot-demo) shows how you can use the Chainguard JDK image to produce a custom JRE. For reference, here are two additional articles describing the use of `jlink` to create optimized application images:

- [Creating your own runtime using jlink](https://adoptium.net/en-GB/blog/2021/10/jlink-to-produce-own-runtime/)
- [Creating a Custom JRE for your Java Applications](https://adriankodja.com/creating-a-custom-jre-for-your-java-applications)

## Documentation and Resources

- [How to Migrate a Java Application to Chainguard Images](https://edu.chainguard.dev/chainguard/chainguard-images/videos/java-images/) (video)
- [Building Minimal Images for Applications with Runtimes](https://edu.chainguard.dev/chainguard/chainguard-images/videos/minimal-runtime-images/) (video)
- [Building minimal and low CVE images for Java](https://www.chainguard.dev/unchained/building-minimal-and-low-cve-images-for-java)

The latest builds of Chainguard's JRE image passes the TCK for OpenJDK Java 21.0.3 and Java 22.0.1 as provided by [Oracle under the OpenJDK Community TCK License Agreement](https://openjdk.org/groups/conformance/JckAccess/index.html) (OCTLA) and are [Java Compatibility Kit (JCK) conformant](https://www.chainguard.dev/unchained/chainguards-openjdk-java-images-are-now-jck-conformant).
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