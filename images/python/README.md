<!--monopod:start-->
# python
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/python` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/python/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal Python image based on Wolfi.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```
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
