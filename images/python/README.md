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
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```
<!--getting:end-->

<!--body:start-->
## Variants

We have two images available: a `python:latest-dev` variant that contains `pip` and a shell, and a minimal runtime image that just contains
python itself.

These images are available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
docker pull cgr.dev/chainguard/python:latest-dev
```

## Usage

The python image can be used directly for simple cases, or with a multi-stage build using python-dev as the build container.

```Dockerfile
FROM cgr.dev/chainguard/python:latest-dev as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

# Make sure you update Python version in path
COPY --from=builder /home/nonroot/.local/lib/python3.11/site-packages /home/nonroot/.local/lib/python3.11/site-packages

COPY main.py .

ENTRYPOINT [ "python", "/app/main.py" ]
```
<!--body:end-->
