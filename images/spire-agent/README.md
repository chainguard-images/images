<!--monopod:start-->
# spire-agent
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/spire-agent` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/spire-agent/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based `spire-agent` image.

**Note**: Unlike most other Chainguard images, the `spire-agent` image must run as root.
This is due to a constraint in the way it is typically deployed into Kubernetes clusters.
See https://github.com/spiffe/spire/issues/1862 for more context.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/spire-agent:latest
```
