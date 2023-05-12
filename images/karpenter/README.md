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

To try it out, follow the [official installation
instructions](https://karpenter.sh/preview/getting-started/getting-started-with-karpenter/) but edit
the Helm command to use our image. To do this, you'll first need to retrieve the digest of our
image, which you can do with [crane](https://github.com/google/go-containerregistry/tree/main/cmd/crane) or Docker:

```
$ DIGEST=$(crane digest --platform linux/amd64 cgr.dev/chainguard/karpenter:latest)
$ echo $DIGEST
sha256:8a178372c9e105300104d48065d61022fe1bd268737edaba4ac83e2c10159276

$ docker manifest inspect cgr.dev/chainguard/karpenter | \
  jq '.manifests[] | select(.platform.architecture == "amd64").digest'
$ echo $DIGEST
sha256:8a178372c9e105300104d48065d61022fe1bd268737edaba4ac83e2c10159276
```
Note that you need to specify the platform required to get the correct digest.

Finally, edit the `helm upgrade` command to include the following lines:

```
--set controller.image.repository=cgr.dev/chainguard/karpenter \
--set controller.image.digest=$DIGEST \
```
