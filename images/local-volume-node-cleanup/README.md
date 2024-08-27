<!--monopod:start-->
# local-volume-node-cleanup
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/local-volume-node-cleanup` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/local-volume-node-cleanup/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
The local volume node cleanup controller removes PersistentVolumes and PersistentVolumeClaims that reference deleted Nodes.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/local-volume-node-cleanup:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

There is an example of how to deploy the local volume node cleanup controller in the [official documentation](https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner/blob/master/docs/node-cleanup-controller.md#usage), but here is a quick guide:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/node-cleanup-controller/rbac.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/node-cleanup-controller/deployment.yaml
        
kubectl set image deployment/local-volume-node-cleanup-controller local-volume-node-cleanup-controller="cgr.dev/chainguard/local-volume-node-cleanup:latest"
```

Do not forget to change the arguments in the deployment file to match your environment. Because in the documentation, they mentinoded that these are the (optional) important arguments that are highly recommended to be used: https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner/blob/master/docs/node-cleanup-controller.md#important-optional-arguments-that-are-highly-recommended-to-be-used

<!--body:end-->
