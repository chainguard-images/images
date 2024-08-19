<!--monopod:start-->
# nodetaint
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nodetaint` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/nodetaint/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal [nodetaint](https://github.com/wish/nodetaint) container image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nodetaint:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

To install on you Kubernetes, you can use the `Helm`:

```shell
git clone https://github.com/wish/nodetaint && cd nodetaint

helm install nodetaint ./chart \
  --namespace nodetaint \
  --create-namespace \
  --set image.registry=${IMAGE_REGISTRY} \
  --set image.repository=${IMAGE_REPOSITORY} \
  --set image.tag=${IMAGE_TAG}
```
<!--body:end-->
