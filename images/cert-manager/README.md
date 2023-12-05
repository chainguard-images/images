<!--monopod:start-->
# cert-manager
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cert-manager` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cert-manager/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Cert Manager](https://cert-manager.io/) Automatically provision and manage TLS certificates in Kubernetes
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cert-manager:latest
```
<!--getting:end-->

<!--body:start-->
## Using Cert Manager

These set of images are a drop in replacement for the standard `cert-manager` installation ([here](https://cert-manager.io/docs/installation/)), and replacing them with the Chainguard images.

For example, we can use these images with the helm installation and the following values:

```yaml
image:
    repository: cgr.dev/chainguard/cert-manager-controller
    tag: latest

cainjector:
    image:
        repository: cgr.dev/chainguard/cert-manager-cainjector
        tag: latest
acmesolver:
    image:
        repository: cgr.dev/chainguard/cert-manager-acmesolver
        tag: latest
webhook:
    image:
        repository: cgr.dev/chainguard/cert-manager-webhook
        tag: latest
```
<!--body:end-->
