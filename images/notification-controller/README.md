<!--monopod:start-->
# notification-controller
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/notification-controller` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/notification-controller/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

## Get It

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/notification-controller
```

## Using `notification-controller`

The `notification-controller` is part of the flux gitops toolkit components ([docs](https://fluxcd.io/flux/components/)). It is recommended to use this component in conjunction with the remaining toolkit components during install.

Although there are multiple methods of [installing](https://fluxcd.io/flux/installation/), the example below demonstrates using the `flux` cli, also available as a chainguard image (`cgr.dev/chainguard/flux`):

> NOTE: Installation assumes a properly connected `kubectl` context.

```bash
# Using a pre-installed flux cli
flux install --registry cgr.dev/chainguard

# OR using the provided flux chainguard image
docker run cgr.dev/chainguard/flux export --registry cgr.dev/chainguard | kubectl apply -f -
```
