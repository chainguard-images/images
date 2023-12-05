<!--monopod:start-->
# qdrant
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/qdrant` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/qdrant/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[qdrant](https://github.com/qdrant/qdrant) Qdrant is a high-performance, massive-scale Vector Database for the next generation of AI.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/qdrant:latest
```
<!--getting:end-->

<!--body:start-->
## Using Qdrant

This image should be a drop-in replacement for the upstream image, and works by default in the helm charts.

To install, follow the steps here: https://qdrant.tech/documentation/guides/installation

But override the image variable in the helm chart:

```shell
$ helm repo add qdrant https://qdrant.to/helm
$ helm upgrade --install qdrant --set image.repository=cgr.dev/chainguard/qdrant --set image.tag=latest qdrant/qdrant
```

The only notable difference is that this image contains both a root and a non-root user, so you can't/don't need to use the `useUnprivileged` [helm variable](https://github.com/qdrant/qdrant-helm/blob/2ddefd61ccd9da092739eaf13f9a76b8b3cfd55e/charts/qdrant/values.yaml#L7C7-L7C7)

Because the helm chart uses the same image for intializing file system permissions and running the final app, we have to run as a root user by default.
The image can still be run as a non-root user (in this case `qdrant`), and the helm chart properly sets that up by default.
<!--body:end-->
