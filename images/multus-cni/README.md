<!--monopod:start-->
# multus-cni
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/multus-cni` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/multus-cni/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A CNI meta-plugin for multi-homed pods in Kubernetes
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/multus-cni:latest
```
<!--getting:end-->

<!--body:start-->
## Usage
This wolfi-based minimal image corresponds to the thin image published by the upstream project.
Example below on how to install multus-cni in a cluster with helm, replacing with the chainguard image:

```shell
helm repo add startechnica https://startechnica.github.io/apps
helm repo update
helm install my-release startechnica/multus-cni --namespace my-release --create-namespace \
    --set image.registry=cgr.dev \
    --set image.repository=chainguard/multus-cni \
    --set image.tag=latest
```

Note that the `multus-cni` helm chart by default defines architecture to `amd64`. If deploying with `arm64`, add the following flag:
```
    --set nodeSelector."kubernetes\.io/arch"=arm64
```

For more information, refer to the [upstream documentation](https://github.com/k8snetworkplumbingwg/multus-cni), as well as the documentation for the [helm chart](https://artifacthub.io/packages/helm/startechnica/multus)

<!--body:end-->
