<!--monopod:start-->
# k3s
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/k3s` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/k3s/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image of [K3s](https://k3s.io/), a lightweight Kubernetes distribution
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/k3s:latest
```
<!--getting:end-->

<!--body:start-->
This image is a drop in replacement for the upstream `rancher/k3s` image, which means it works everywhere you would expect.

The quickest way to test it is locally with `docker`:

```bash
docker run --rm -v `pwd`:/etc/rancher/k3s --privileged -p 6443:6443 cgr.dev/chainguard/k3s:latest

KUBECONFIG=k3s.yaml kubectl get po -A
```

You can also use it as a drop in replacement in `k3d`:

```bash
k3d cluster create -i cgr.dev/chainguard/k3s:latest
```
<!--body:end-->
