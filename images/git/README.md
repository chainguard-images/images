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

A minimal Git image.

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

Full details are in [this blog post](https://www.chainguard.dev/unchained/changes-to-static-git-and-busybox-developer-images).

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

If you do not want to make the destination directory world-writable, you can run the git executable inside the container with your UID, thus giving it access to the directory:

```shell
docker run -it -v ~/workspace:/home/git -u $(id -u) --rm cgr.dev/chainguard/git clone https://github.com/chainguard-images/.github.git
```

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