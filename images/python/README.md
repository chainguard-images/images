<!--monopod:start-->
# python
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/python` |
| **Variants/Tags** | `latest`, `latest-dev`, `latest-musl`, `latest-musl-dev` |
---
<!--monopod:end-->

This is a minimal Python image based on Wolfi.

While this image is being developed, we will stick to the latest stable Python version. Supported versions in the long term are TBD.

## Get It!

We have two images available: a `python:dev-latest` variant that contains `pip` and a shell, and a minimal runtime image that just contains
python itself.

These images are available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
docker pull cgr.dev/chainguard/python:dev-latest
```

## Usage

The python image can be used directly for simple cases, or with a multi-stage build using python-dev as the build container.

```Dockerfile
FROM cgr.dev/chainguard/python:dev-latest AS builder
COPY . /app
RUN cd /app && pip install -r requirements.txt

FROM cgr.dev/chainguard/python
COPY --from=builder /app /app

ENTRYPOINT [ "python", "/app/main.py" ]
```
