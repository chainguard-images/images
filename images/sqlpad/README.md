<!--monopod:start-->
# sqlpad
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/sqlpad` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/sqlpad/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for sqlpad

A minimal Wolfi-based image for sqlpad, which is a web application for generating and running SQL queries and visualizing the results. For more information, please refer to the [applications documentation](https://github.com/sqlpad/sqlpad) on github.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/sqlpad:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Important note about data and docker

Unless data volumes are mapped outside the containers, you will lose data inside SQLPad and various database when the containers are shutdown and removed.

If you are using these examples as a starter for something you are working on, you may want to ensure your data is safe before getting into any serious work.

## Running from command line

```sh
# The most minimal example, mapping port 3000 to local docker host
docker run -p 3000:3000 cgr.dev/chainguard/sqlpad:latest

# volume and env vars being set and run in background
# directory `~/docker-volumes` must be shared with docker to work
docker run --name sqlpad -p 127.0.0.1:3000:3000 --volume ~/docker-volumes/sqlpad-postgres:/var/lib/sqlpad --detach cgr.dev/chainguard/sqlpad:latest

# To list running docker images
docker ps

# To stop running docker image by name. (otherwise use container id from `docker ps`)
docker stop sqlpad
```

## Deploying via Helm
A Helm chart is provided for deploying sqlpad in Kubernetes. This can be found in the applications [GitHub repository](https://github.com/sqlpad/sqlpad/tree/master/sqlpad-charts).
Below is an example, using the Chainguard image with the vendor's Helm chart:
```bash
git clone https://github.com/sqlpad/sqlpad.git && cd sqlpad/sqlpad-charts
helm dependency update
helm -n sqlpad install sqlpad  \
    --namespace sqlpad \
    --create-namespace \
    --set image.repository=cgr.dev/chainguard/sqlpad\
    --set image.tag=latest \
    ./
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