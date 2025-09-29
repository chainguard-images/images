<!--monopod:start-->
# REPO_NAME
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/REPO_NAME` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/REPO_NAME/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Minimalist Wolfi-based Java JRE image using [OpenJDK](https://openjdk.org/projects/jdk/). Used for running Java applications.

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

Like most available alternatives, Chainguard's JRE image is built directly from the [OpenJDK project](https://openjdk.org/). The Chainguard JRE image has few-to-zero CVEs and does not run as the root user.

## Getting Started

A JRE is the standard runtime for a Java application and is used for running an already developed and packaged Java application. Generally, you will combine your application with the Chainguard JRE image and Docker or a build tool like [Maven](https://maven.apache.org/) or [Gradle](https://gradle.org/)

### Using Jib to build a JRE-based application image

Using Maven or Gradle, you can compile and package your application. [Jib](https://github.com/GoogleContainerTools/jib/tree/master) is a tool from Google Container Tools which builds optimized Docker and OCI images for Java applications. It's available as a plugin for both Maven and Gradle, as well as a Java library. 

The Jib GitHub repository includes [a useful example application](https://github.com/GoogleContainerTools/jib/tree/master/examples/spring-boot) that works with Maven or Gradle.

### Using Helm to Deploy your Java Application

Using [Helm](https://helm.sh/) to deploy your JRE-based application image is relatively straightforward using either [this Kubernetes Service Helm Chart](https://github.com/gruntwork-io/helm-kubernetes-services/blob/main/charts/k8s-service/README.md) or [this Service Helm Chart](https://artifacthub.io/packages/helm/kvalitetsit/service) from ArtifactHub.

## Documentation and Resources

- (Video) [How to Migrate a Java Application to Chainguard Images](https://edu.chainguard.dev/chainguard/chainguard-images/videos/java-images/)
- (Video) [Building Minimal Images for Applications with Runtimes](https://edu.chainguard.dev/chainguard/chainguard-images/videos/minimal-runtime-images/)
- (Learning Lab) [Chainguard's Java Image Learning Lab](https://www.chainguard.dev/events/chainguards-java-image)
- (Blog) [Building minimal and low CVE images for Java](https://www.chainguard.dev/unchained/building-minimal-and-low-cve-images-for-java)

The latest builds of Chainguard's JRE image pass the TCK for OpenJDK Java 21.0.3 and Java 22.0.1 as provided by [OpenJDK Community TCK License Agreement](https://openjdk.org/legal/openjdk-tck-license.pdf) (OCTLA) and are [Java Compatibility Kit (JCK) conformant](https://www.chainguard.dev/unchained/chainguards-openjdk-java-images-are-now-jck-conformant).
<!--body:end-->

## Get this image as a Chainguard VM

This image is also available as a Chainguard VM, available to deploy on Amazon AWS EC2, Google Cloud Compute Engine, Microsoft Azure and On-Prem through VMware, KVM and QEMU virtualization. Complete our [registration form](https://get.chainguard.dev/vmearlyaccesswaitlist?utm_source=readmes) to get access to Chainguard VMs and try it out for yourself.

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