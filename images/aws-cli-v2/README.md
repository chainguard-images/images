<!--monopod:start-->
# aws-cli-v2
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/aws-cli-v2` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/aws-cli-v2/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for aws-cli-v2

Minimal [aws-cli v2](https://github.com/aws/aws-cli/tree/v2) container image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/aws-cli-v2:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

Before using the aws-cli Chainguard Image, you need to configure your [AWS credentials](https://github.com/aws/aws-cli/tree/v2#getting-started). There are a number of ways you can do this, so we encourage you to review the official [AWS credentials documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#configure-precedence) to determine what method works best for you.

AWS credentials and configurations are typically stored in a directory named `.aws`. Assuming you've already set up your AWS credentials locally, you can share them from your host machine to a container by mounting this directory as a volume. The following command follows this method to pass along AWS credentials in order to retrieve a list of EKS clusters: 

```shell
docker run --rm -it -v ~/.aws:/home/nonroot/.aws:ro cgr.dev/chainguard/aws-cli-v2:latest s3 ls
```

Note that Chainguard's aws-cli Image has a single user `nonroot` with uid `65532`, belonging to gid `65532`.; the previous command mounts the local `.aws` directory under this user's home directory. Be aware that if you follow this method you may need to adjust the permissions of your local credentials file in order for the container to be able to read it.

You can get help with any command when using the AWS Command Line Interface (AWS CLI) by following any command name with `help`. For example, the following command displays help for the general AWS CLI options and the available top-level commands:

```shell
docker run --rm cgr.dev/chainguard/aws-cli-v2:latest help
```

The following command displays help information for the `aws ec2 run-instances` command:

```shell
docker run --rm cgr.dev/chainguard/aws-cli-v2:latest ec2 run-instances help
```

Please refer to the official [Getting Started](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-help.html) guide for more information.
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