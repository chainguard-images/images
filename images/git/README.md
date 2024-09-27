<!--monopod:start-->
# git
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/git` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/git/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for git

A minimal Git image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/git:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
Note that there is also glibc version of this Image available:

```
docker pull cgr.dev/chainguard/git:latest-glibc
```

## Upcoming Changes

On July 15, 2024 several images in this repository will move from a Alpine base to a Wolfi base,
in-line with all other images in our registry. We do not expect this to cause breakages, but
encourage all users to test and verify the new versions.

The affected tags are:

 - `latest`
 - `latest-root` 
 - `latest-dev` 
 - `latest-root-dev`

You can test today by migrating to one of the following images:

 - `latest-glibc`
 - `latest-glibc-root` 
 - `latest-glibc-dev` 
 - `latest-glibc-root-dev`

From July 15 the `glibc` tag and the corresponding tag without `glibc` will point to the same
images.

Full details are in [this blog post](https://www.chainguard.dev/unchained/changes-to-static-git-and-busybox-developer-images-2).

## Usage

Chainguard's Git Image allows you to run ordinary Git commands in CI/CD pipelines and also locally via Docker.

### Docker Setup

To make sure you have the latest version of the Image available, start by running a `docker pull` command:

```shell
docker pull cgr.dev/chainguard/git
```

Then, run the Image with the `--version` flag to make sure the Image is functional:

```shell
docker run -it --rm cgr.dev/chainguard/git --version
```

You will receive output similar to this:

```
git version 2.43.0
```

### Cloning a Repository Locally

Because your local system user's unique identifier might differ from that of the container, you'll need to set up special permissions for the target directory if you want to use this Image to clone repositories locally. Once you've configured these permissions, you'll be able to set up a volume and have the contents of the cloned repository replicated on your host machine.

First, create a target directory somewhere in your home folder and set the required permissions:

```shell
mkdir ~/workspace
chmod go+wrx ~/workspace
```

Now you can use `docker run` to execute the `git clone` command, using the directory you just set up as a volume shared between your local machine and the container Image:

```shell
docker run -it -v ~/workspace:/home/git --rm cgr.dev/chainguard/git clone https://github.com/chainguard-images/.github.git
```

Here, the volume is mounted to the `/home/git` directory in the container.

This will return output like the following:

```
Cloning into '.github'...
remote: Enumerating objects: 251, done.
remote: Counting objects: 100% (33/33), done.
remote: Compressing objects: 100% (23/23), done.
remote: Total 251 (delta 15), reused 22 (delta 10), pack-reused 218
Receiving objects: 100% (251/251), 216.59 KiB | 1.04 MiB/s, done.
Resolving deltas: 100% (88/88), done.
```

You can now check the contents of your `workspace` directory, where you will find the cloned repository:

```shell
ls -a ~/workspace/
```
```
.  ..  .github
```
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