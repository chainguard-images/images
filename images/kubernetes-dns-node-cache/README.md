<!--monopod:start-->
# kubernetes-dns-node-cache
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-dns-node-cache` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubernetes-dns-node-cache/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image that acts as a drop-in replacement for the [NodeLocal DNSCache](https://github.com/kubernetes/dns) image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-dns-node-cache:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```shell
helm repo add deliveryhero https://charts.deliveryhero.io/
helm repo update
helm install node-local-dns deliveryhero/node-local-dns \
    --set image.repository=cgr.dev/chainguard/kubernetes-dns-node-cache \
    --set image.tag=latest
```
<!--body:end-->
