<!--monopod:start-->
# karpenter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/karpenter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/karpenter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with Karpenter. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/karpenter:latest
```
<!--getting:end-->

<!--body:start-->
## Using Karpenter

The Chainguard Karpenter image contains the `karpenter` controller and is a drop-in replacement for the upstream image.

To try it out, follow the [official installation
instructions](https://karpenter.sh/preview/getting-started/getting-started-with-karpenter/) but edit
the Helm command to use the Chainguard image. To do this, you'll first need to retrieve the digest
of the Chainguard image, which you can do with
[crane](https://github.com/google/go-containerregistry/tree/main/cmd/crane) or Docker:

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
<!--body:end-->
