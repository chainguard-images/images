<!--monopod:start-->
# zig
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/zig` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/zig/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with zig binary.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/zig:latest
```

This image should be used to build and test zig applications.
You should *not* use it as a runtime image.

For runtime images, you can use `cgr.dev/chainguard/static` or `cgr.dev/chainguard/glibc-dynamic` depending on the type of zig application you build.
