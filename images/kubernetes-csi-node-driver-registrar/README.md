<!--monopod:start-->
# kubernetes-csi-node-driver-registrar
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-csi-node-driver-registrar` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubernetes-csi-node-driver-registrar/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
 Sidecar container that registers a CSI driver with the kubelet using the kubelet plugin registration mechanism. 
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-csi-node-driver-registrar:latest
```
<!--getting:end-->

<!--body:start-->
## Run it

Generally speaking, the `kubernetes-csi-node-driver-registrar` is a low level Kubernetes component used to register drivers, and not meant to be managed directly. However, all the steps outlined in the [upstream repo](https://github.com/kubernetes-csi/node-driver-registrar) apply just as well to the Chainguard Image version.
<!--body:end-->
