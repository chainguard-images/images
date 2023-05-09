<!--monopod:start-->
# musl-dynamic
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/musl-dynamic` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/musl-dynamic.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Base image with just enough files to run static binaries!

This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.

This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```
# Usage

See the [examples/](https://github.com/chainguard-images/images/tree/main/images/musl-dynamic/examples) directory for
an example C program and associated Dockerfile
that can be used with this image.
