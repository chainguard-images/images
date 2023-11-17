<!--monopod:start-->
# ingress-nginx-controller

<!--url:start-->
<a href="https://github.com/kubernetes/ingress-nginx">
<!--logo:start-->
  <img src="https://storage.googleapis.com/chainguard-academy/logos/ingress-nginx-controller/logo.svg" width="36px" height="36px" />
<!--logo:end-->
</a>
<!--url:end-->

| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/ingress-nginx-controller` |

* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/ingress-nginx-controller/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*
---
<!--monopod:end-->

<!--overview:start-->
 Ingress-NGINX Controller for Kubernetes
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ingress-nginx-controller:latest
```
<!--getting:end-->

<!--body:start-->
## Using `ingress-nginx-controller`

The Chainguard image is a drop in replacement for the upstream image. For example, to install with the upstream helm chart:

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm install foo ingress-nginx/ingress-nginx --set image.repository=cgr.dev/chainguard/ingress-nginx-controller
```
<!--body:end-->
