<!--monopod:start-->
# kubernetes-dashboard
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-dashboard` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubernetes-dashboard/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image that acts as a drop-in replacement for the `kubernetesui/dashboard` image.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-dashboard:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

The dashboard listens on port `8443` by default.
<!--compatibility:end-->

<!--body:start-->
You can run it with the standard deployment with something like:

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl set image -n kubernetes-dashboard deployment/kubernetes-dashboard kubernetes-dashboard="cgr.dev/chainguard/kubernetes-dashboard:latest"
```
<!--body:end-->
