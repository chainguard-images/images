<!--monopod:start-->
# ruby
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/ruby` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/ruby/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for ruby

Minimal Ruby base image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/ruby:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard's Ruby image is meant to serve as a drop-in replacement for the official Ruby image from Docker Hub. There are, however, a number of differences between the two images that one should be aware of before migrating to the Chainguard Ruby image:

* The Chainguard Ruby image does not run as the root user and contains only the minimum packages it needs to operate.
* Ruby applications typically require the installation of third-party dependencies through [Rubygems](https://rubygems.org/). This means that using a fully distroless image for building your application would not work, as these do not include a package manager. In cases like this, you’ll need to implement a multi-stage Docker build that uses one of Chainguard's `-dev` Image variants to set up the application.
* [Bundler](https://bundler.io/), a popular tool for installing Ruby gems, typically installs to `/usr/lib/bundle`. The default installation location in the Chainguard Ruby image is `/home/nonroot`, which can cause issues for dependencies that expect to find gems in `/usr/lib/bundle`.
* Environment variables, especially gem paths, sometimes differ from those in the official Ruby Image.
* The Chainguard Ruby Image does not default to using `UTF-8`. You will need to specify this yourself.

To better understand the differences between Chainguard's Ruby image and alternatives, it may be helpful to review the upstream's Dockerfiles. For example, you can review the [`alpine3.21` Dockerfile available for Ruby 3.3](https://github.com/docker-library/ruby/blob/master/3.3/alpine3.21/Dockerfile).

## Getting Started

To better understand how you can work with the Chainguard Ruby Image, we encourage you to check out our guide on [getting started with Ruby](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/getting-started-ruby/). This resource demonstrates how you can use Chainguard's Ruby Image in both single- and multi-stage builds.


## Documentation and Resources

* [Getting Started with the Ruby Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/ruby/)
*  [Vulnerability comparison: ruby](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/ruby/)
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