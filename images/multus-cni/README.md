<!--monopod:start-->
# multus-cni
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/multus-cni` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/multus-cni/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A CNI meta-plugin for multi-homed pods in Kubernetes
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/multus-cni:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Example below on how to install multus-cni in a cluster with helm, replacing with the chainguard image:

```shell
helm repo add startechnica https://startechnica.github.io/apps
helm repo update
helm install my-release startechnica/multus --namespace my-release --create-namespace \
    --set image.repository=cgr.dev/chainguard/multus-cni \
    --set image.tag=latest
```

For more information, refer to the [upstream documentation](https://github.com/k8snetworkplumbingwg/multus-cni), as well as the documentation for the [helm chart](https://artifacthub.io/packages/helm/startechnica/multus)

<!--body:end-->
