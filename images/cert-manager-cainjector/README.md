<!--monopod:start-->
# cert-manager-cainjector
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/cert-manager-cainjector` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/cert-manager-cainjector.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

## Get It

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cert-manager-cainjector
```

## Using Cert Manager

This image is part of the `cert-manager` controller stack, and is used following the standard `cert-manager` installation ([here](https://cert-manager.io/docs/installation/)), and replacing them with the Chainguard images.

This image is part of the `cert-manager` stack, and can be used as a drop in replacement for the images following the standard `cert-manager` [installation](https://cert-manager.io/docs/installation/).

For example, we can use these images with the helm installation and the following values:

```yaml
# just this image
cainjector:
    image:
        repository: cgr.dev/chainguard/cert-manager-cainjector
        tag: latest
        
# all the images
image:
    repository: cgr.dev/chainguard/cert-manager-controller
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
