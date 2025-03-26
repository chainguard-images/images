<!--monopod:start-->
# hugo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/hugo` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/hugo/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for hugo

This is a minimal [Hugo](https://gohugo.io/) image.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/hugo:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Application Setup for End Users

The following is an example of using the Hugo image locally. It's based on the official [Hugo "quickstart"](https://gohugo.io/getting-started/quick-start/#commands) example.

To begin, start a shell in the Hugo developer (dev) container.

```shell
docker run -v $PWD/data:/home/data --entrypoint=/bin/sh -p 8080:8080 -it \
cgr.dev/chainguard/hugo:latest-dev
```

Create a new Hugo site using the quickstart commands.

```shell
hugo new site quickstart
```

Navigate into the new site's root directory.

```shell
cd quickstart
```

Initiate an empty Git repository 

```shell
git init
```

Clone a Hugo theme into the `themes` directory. 

```shell
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
```

Add a line to the site's configuration file to let Hugo know to use the new theme.

```shell
echo "theme = 'ananke'" >> hugo.toml
```

Start the Hugo development server to serve the site. Be sure to change the default bind address and port to make the site accessible outside of the container.

```shell
hugo serve --bind 0.0.0.0 --port 8080
```

Now open your browser to [localhost:8080](http://localhost:8080) to visit the sample site.

When finished, you can press `CTRL + C` to stop the Hugo server from running, and then `CTRL + D` to exit the container shell.

If you're interested in enterprise support, SLAs, and access to older tags, [get in touch](https://www.chainguard.dev/contact?utm_source=docs).
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