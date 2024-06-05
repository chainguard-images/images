<!--monopod:start-->
# kubernetes-csi-external-provisioner
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-csi-external-provisioner` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubernetes-csi-external-provisioner/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image that acts as a drop-in replacement for the `kubernetes-csi/external-provisioner` image.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-csi-external-provisioner:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

The image runs as `root` so that it can mount a `CSI_ENDPOINT` socket.
<!--compatibility:end-->

<!--body:start-->
You can run it with the standard deployment with something like:

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/rbac.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/v3.5.0/deploy/kubernetes/deployment.yaml
kubectl set image deployment/csi-provisioner csi-provisioner="cgr.dev/chainguard/kubernetes-csi-external-provisioner:latest"
```
<!--body:end-->
