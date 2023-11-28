<!--monopod:start-->
# graalvm-native
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/graalvm-native` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/graalvm-native/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Base image with just enough files to run native [GraalVM](https://www.graalvm.org/) native-image binaries.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/graalvm-native:latest
```
<!--getting:end-->

<!--body:start-->
## Using


This image includes `glibc` and `libz`, and is designed to contain exactly what's needed to run GraalVM native-image binaries.

This image is meant to be used as a base image only, and is otherwise useless.  It contains the `wolfi-baselayout-data` package from Wolfi, which is just a set of data files needed to support glibc static binaries at runtime.

## Users

The image has a single user `nonroot` with uid `65532`, belonging to gid `65532`.
<!--body:end-->
