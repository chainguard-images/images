<!--monopod:start-->
# dynamic-localpv-provisioner
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dynamic-localpv-provisioner` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/dynamic-localpv-provisioner/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Dynamic Local Volumes for Kubernetes Stateful workloads.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dynamic-localpv-provisioner:latest
```
<!--getting:end-->

<!--body:start-->
## Testing

Fortunately, we have a Helm Chart ready-to-use for testing this image.

You can find it [here](https://github.com/openebs/dynamic-localpv-provisioner/blob/develop/deploy/helm/charts/README.md).

Basically, all you need to do is running the commands below to test the application:

```shell
helm repo add openebs-localpv https://openebs.github.io/dynamic-localpv-provisioner
helm repo update
helm install openebs-localpv openebs-localpv/dynamic-localpv-provisioner \
  --set localpv.image.registry=cgr.dev/ \
  --set localpv.image.repository=chainguard/dynamic-localpv-provisioner \
  --set localpv.image.tag=latest
```

Once you run the commands above, you will end up having the application running on your cluster.
<!--body:end-->
