<!--monopod:start-->
# cert-manager-webhook
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/cert-manager-webhook` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/cert-manager-webhook.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

[Cert Manager](https://cert-manager.io/) Automatically provision and manage TLS certificates in Kubernetes

## Get It

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cert-manager-webhook
```

## Using Cert Manager

This image is part of the `cert-manager` controller stack, and is used following the standard `cert-manager` installation ([here](https://cert-manager.io/docs/installation/)), and replacing them with the Chainguard images.

This image is part of the `cert-manager` stack, and can be used as a drop in replacement for the images following the standard `cert-manager` [installation](https://cert-manager.io/docs/installation/).

For example, we can use these images with the helm installation and the following values:

```yaml
# just this image
webhook:
    image:
        repository: cgr.dev/chainguard/cert-manager-webhook
        tag: latest

# all the images
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
```
