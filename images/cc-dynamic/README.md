<!--monopod:start-->
# cc-dynamic
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cc-dynamic` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cc-dynamic/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Base image with just enough to run arbitrary binaries that may require gcc or cc libraries, typically C++ or Rust binaries.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cc-dynamic:latest
```
<!--getting:end-->

<!--body:start-->

This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.

You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.

This image is deprecated.  Use the `glibc-dynamic` image instead which is designed to cover the same use cases.
<!--body:end-->
