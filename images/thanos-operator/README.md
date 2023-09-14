<!--monopod:start-->
# thanos-operator
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/thanos-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/thanos-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the [thanos-operator](https://github.com/banzaicloud/thanos-operator).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/thanos-operator:latest
```

## Usage

```shell
helm repo add banzaicloud-stable https://kubernetes-charts.banzaicloud.com
helm repo update
helm install thanos-operator banzaicloud-stable/thanos-operator \
    --set image.repository=cgr.dev/chainguard/thanos-operator \
    --set image.tag=latest
```
