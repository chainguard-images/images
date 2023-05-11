<!--monopod:start-->
# karpenter
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/karpenter` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/karpenter.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with Karpenter. **EXPERIMENTAL**

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/karpenter:latest
```

## Using Karpenter

The Chainguard Karpenter image contains the `karpenter` controller and is a drop-in replacement for the upstream image.

To try it out, follow the [official installation instructions](https://karpenter.sh/preview/getting-started/getting-started-with-karpenter/) but edit the Helm command to include the following arguments:

```
--set controller.image.repository=cgr.dev/chainguard/karpenter \
--set controller.image.digest=$DIGEST
```
