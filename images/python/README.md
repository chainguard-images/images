<!--monopod:start-->
# python
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/python` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/python/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for python

Minimal Python image based on Wolfi.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/python:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Description

The `python` Chainguard Image provides a minimal Python runtime suitable for workloads such as web applications, CLI utilities, interfacing with APIs, or other tasks.

## Variants

We have two image variants available:

- A `python:latest-dev` variant that contains the `pip`, `uv`, and `apk` package managers and the `bash`, `ash`, and `sh` shells.
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

## Get this image as a Chainguard VM

This image is also available as a Chainguard VM, available to deploy on Amazon AWS EC2, Google Cloud Compute Engine, Microsoft Azure and On-Prem through VMware, KVM and QEMU virtualization. Complete our [registration form](https://get.chainguard.dev/vmearlyaccesswaitlist?utm_source=readmes) to get access to Chainguard VMs and try it out for yourself.

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