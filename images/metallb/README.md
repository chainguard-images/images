<!--monopod:start-->
# metallb
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/metallb` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/metallb/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
[MetalLB](https://metallb.org) provides network load balancers for bare-metal Kubernetes clusters
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/metallb:latest
```
<!--getting:end-->

<!--body:start-->
Configuring MetalLB for your Kubernetes environment is beyond the scope of this document. It has multiple configuration options depending on the mode that it is configured to use (Layer 2 or BGP). Refer to the [MetalLB Concepts](https://metallb.universe.tf/concepts/) documentation for details on how each mode works.

Their [installation guide](https://metallb.universe.tf/installation/) is a good reference that has numerous examples using Kubernetes manifests, Kustomize manifests, and Helm charts.

Finally, visit the [configuration reference pages](https://metallb.universe.tf/configuration/) for details on how to use MetalLb in each mode with different CNI providers.
<!--body:end-->
