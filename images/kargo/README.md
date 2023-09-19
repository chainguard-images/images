<!--monopod:start-->
# kargo
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/kargo` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kargo/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the `kargo` application lifecyle management server.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kargo:latest
```

This image contains the `kargo` tool, as well as `grpc-health-probe`, which is required for health checking.
This image is a drop-in replacement for the official Kargo image and can be used in the same way.

To run it with the official helm chart:

```
$ helm install kargo \
  oci://ghcr.io/akuity/kargo-charts/kargo \
  --version 0.1.0-rc.23 \
  --namespace kargo \
  --create-namespace \
  --set api.service.type=NodePort \
  --set api.service.nodePort=30084 \
  --set 'api.adminAccount.password=admin' \
  --set image.repository=cgr.dev/chainguard/kargo \
  --set image.tag=latest \
  --wait 
```
