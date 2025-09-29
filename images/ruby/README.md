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

Minimal Ruby base image.

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