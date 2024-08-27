<!--monopod:start-->
# kubernetes-autoscaler-addon-resizer
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-autoscaler-addon-resizer` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubernetes-autoscaler-addon-resizer/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Addon-resizer is a container that vertically scales a Deployment based on the number of nodes in your cluster.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-autoscaler-addon-resizer:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/addon-resizer/deploy/example.yaml
kubectl set image deployment/nanny-v1 pod-nanny=cgr.dev/chainguard/kubernetes-autoscaler-addon-resizer:latest
```

Find more on the [official documentation](https://github.com/kubernetes/autoscaler/blob/master/addon-resizer/README.md)!
<!--body:end-->
