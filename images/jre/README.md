<!--monopod:start-->
# jre
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/jre` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/jre/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for jre

Minimalist Wolfi-based Java JRE image using [OpenJDK](https://openjdk.org/projects/jdk/). Used for running Java applications.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/jre:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Like most available alternatives, Chainguard's JRE image is built directly from the [OpenJDK project](https://openjdk.org/).

The main differences between Chainguard's JRE image and other options are its enhanced security features. These include the fact that the Chainguard JRE image has few-to-zero CVEs and that it does not run as the root user. 

## Getting Started

A JRE is the standard runtime for a Java application and is used for running an already developed and packaged Java application. Generally, you will combine your application with the Chainguard JRE image and Docker or a build tool like [Maven](https://apache.maven.org) or [Gradle](https://gradle.org/)

### Using Jib to build a JRE-based application image

Using Maven or Gradle you can compile and package your application. [Jib](https://github.com/GoogleContainerTools/jib/tree/master) is a tool from Google Container Tools which builds optimized Docker and OCI images for Java applications. It's available as plugins for Maven and Gradle, as well as a Java library. 

The Jib GitHub repository includes [a useful example application](https://github.com/GoogleContainerTools/jib/tree/master/examples/spring-boot) that works with Maven or Gradle.

### Using Helm to Deploy your Java Application

Using [Helm](https://helm.sh/) to deploy your JRE-based application image is relatively straightforward using either [this Kubernetes Service Helm Chart](https://github.com/gruntwork-io/helm-kubernetes-services/blob/main/charts/k8s-service/README.md) or [this Service Helm Chart](https://artifacthub.io/packages/helm/kvalitetsit/service) from ArtifactHUB.

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