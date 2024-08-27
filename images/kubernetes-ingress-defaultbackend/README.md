<!--monopod:start-->
# kubernetes-ingress-defaultbackend
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-ingress-defaultbackend` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubernetes-ingress-defaultbackend/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image that acts as a drop-in replacement for the `registry.k8s.io/defaultbackend` image. Used in some ingresses like https://github.com/kubernetes/ingress-gce and https://github.com/kubernetes/ingress-nginx
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-ingress-defaultbackend:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

The image runs as `non-root`.
<!--compatibility:end-->

<!--body:start-->


You can run it with the standard deployment using nginx-ingress with something like:

```
helm install <RELEASE_NAME> ingress-nginx/ingress-nginx \
  --set defaultBackend.image.registry=cgr.dev/chainguard \
  --set defaultBackend.image.image=kubernetes-ingress-defaultbackend \
  --set defaultBackend.image.tag=latest
```
<!--body:end-->
