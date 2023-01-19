<!--monopod:start-->
# cc-dynamic
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/cc-dynamic` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/cc-dynamic.svg) |
---
<!--monopod:end-->

Base image with just enough to run arbitrary binaries that may require gcc or cc libraries.
These are typically C++ or Rust binaries.

This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.

You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cc-dynamic:latest
```
