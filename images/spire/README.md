<!--monopod:start-->
# spire
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/spire` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/spire/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based `spire` images.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/spire:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

**Note**: Unlike most other Chainguard images, the `spire-agent` image must run as root.
This is due to a constraint in the way it is typically deployed into Kubernetes clusters.
See https://github.com/spiffe/spire/issues/1862 for more context.

<!--compatibility:end-->

<!--body:start-->

**Note**: Unlike most other Chainguard images, the `spire-agent` image must run as root.
This is due to a constraint in the way it is typically deployed into Kubernetes clusters.
See https://github.com/spiffe/spire/issues/1862 for more context.
<!--body:end-->
