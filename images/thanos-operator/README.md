<!--monopod:start-->
# thanos-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/thanos-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/thanos-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with the [thanos-operator](https://github.com/banzaicloud/thanos-operator).
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/thanos-operator:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```shell
helm repo add banzaicloud-stable https://kubernetes-charts.banzaicloud.com
helm repo update
helm install thanos-operator banzaicloud-stable/thanos-operator \
    --set image.repository=cgr.dev/chainguard/thanos-operator \
    --set image.tag=latest
```
<!--body:end-->
