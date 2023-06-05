<!--monopod:start-->
# kubernetes-csi-external-resizer
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-csi-external-resizer` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubernetes-csi-external-resizer/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with [kubernetes-csi/external-resizer](https://github.com/kubernetes-csi/external-resizer).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/external-resizer:latest
```

## Using external-resizer

The Chainguard external-resizer image contains the `csi-resizer` controller and is a drop-in replacement for the upstream image.

To try it out, follow the [official installation
instructions](https://github.com/kubernetes-csi/external-resizer/blob/master/README.md#usage).
