<!--monopod:start-->
# python
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/python` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/python/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for python

Minimal Python image based on Wolfi.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/python:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Description

The `python` Chainguard Image provides a minimal Python runtime suitable for workloads such as web applications, CLI utilities, interfacing with APIs, or other tasks.

## Variants

We have two image variants available:

- A `python:latest-dev` variant that contains the `pip` and `apk` package managers and the `bash`, `ash`, and `sh` shells.
- A minimal runtime variant that removes shells and package managers for additional security.

To pull the minimal runtime variant from `cgr.dev`:

```sh
docker pull cgr.dev/chainguard/python:latest
```
To pull the dev variant:


```sh
docker pull cgr.dev/chainguard/python:latest-dev
```

## Usage Notes

The entrypoint for the `python` Chainguard Image is `/usr/bin/python`. Commands run as part of `docker run` or a `CMD` statement in a Dockerfile will be passed as arguments to `python`.

To access the shell in the `python:latest-dev` image, you'll need to include an `--entrypoint` option, as in the following example.

```sh
docker run -it --entrypoint /bin/bash chainguard/python:latest-dev
```

Also note that the `python` image uses the `nonroot` user by default. To perform operations such as installing packages with `apk`, run the image as root.

```sh
docker run -it --user root --entrypoint /bin/bash chainguard/python:latest-dev
```

We recommend against using the root user in a production environment.

## Packages

If you require additional packages that can be installed with the `pip` package manager, we recommend using a multistage build. This process involves installing packages in a virtual environment using the `latest-dev` variant, then copying this environment over to the minimal runtime image. 

The following is a minimal example of a Dockerfile that uses a multistage build to run an `app.py` script after installing dependencies listed in a `requirements.txt` file.

```Dockerfile
# syntax=docker/dockerfile:1

FROM cgr.dev/chainguard/python:latest-dev as dev

WORKDIR /app

RUN python -m venv venv
ENV PATH="/app/venv/bin":$PATH
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

COPY app.py app.py
COPY --from=dev /app/venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

ENTRYPOINT ["python", "app.py"]
```

For a more complete example, see [Getting Started with the Python Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/python/) on Chainguard Academy.

## Resources

- [Getting Started with the Python Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/python/)
- [Migrating to Python Chainguard Images](https://edu.chainguard.dev/chainguard/migration/migrating-python/)
- [Updating a Python Microservice for Chainguard Images](https://edu.chainguard.dev/chainguard/migration/porting-apps-to-chainguard/#updating-the-python-microservice)
- [Debugging Distroless Images](https://edu.chainguard.dev/chainguard/chainguard-images/debugging-distroless-images/)
- [Blog Post: Securely Containerize a Python Application with Chainguard Images](https://dev.to/chainguard/securely-containerize-a-python-application-with-chainguard-images-bn8)
- [Video: How to containerize a Python application with a multi-stage build using Chainguard Images](https://www.youtube.com/watch?v=2D0JULd4E5A)
- [Learning Lab: Deploying a Flask App with Python and nginx Chainguard Images](https://www.youtube.com/watch?v=i6bDKplnp6I)
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