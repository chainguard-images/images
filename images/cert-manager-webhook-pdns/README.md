<!--monopod:start-->
# cert-manager-webhook-pdns
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cert-manager-webhook-pdns` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/cert-manager-webhook-pdns/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A PowerDNS webhook for cert-manager
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cert-manager-webhook-pdns:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.
You can run it using the Helm Chart with:

```shell
$ helm repo add cert-manager-webhook-pdns https://zachomedia.github.io/cert-manager-webhook-pdns
$ helm install cert-manager-webhook-pdns cert-manager-webhook-pdns/cert-manager-webhook-pdns \
    --set image.registry=cgr.dev/chainguard/cert-manager-webhook-pdns \
    --set image.tag=latest
```
<!--body:end-->
