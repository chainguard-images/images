<!--monopod:start-->
# jdk-lts
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/jdk-lts` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/jdk-lts/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Java JDK image using using [OpenJDK](https://openjdk.org/projects/jdk/).  Used for compiling Java applications.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk-lts:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

### Upcoming Changes

On August 12, 2024 this image will be removed to be consistent with our other images which only make
the latest version available. We recommend you move to use the [jdk image](../jdk/README.md). Note
that this image uses a different version of Java, which may require changes to your build system or
application.

Full details are in [this blog post](https://www.chainguard.dev/unchained/updates-to-lts-images-in-chainguard-images-developer-tier).

<!--compatibility:end-->

<!--body:start-->
<!--body:end-->
