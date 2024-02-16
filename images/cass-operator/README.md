<!--monopod:start-->
# cass-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cass-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cass-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[cass-operator](https://github.com/k8ssandra/cass-operator), is a Kubernetes operator for managing Apache Cassandra. It automates tasks like deployment, scaling, and configuration management, facilitating the integration of Cassandra clusters with Kubernetes environments.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cass-operator:latest
```
<!--getting:end-->

<!--body:start-->

## Usage
cass-operator is a Kubernetes operator, which can be deployed using helm. Refer to the [upstream repositories documentation](https://github.com/k8ssandra/cass-operator) for how to get started with cass-operator.

To use our minimal, wolfi-based image with this Helm chart you'll need to override the image used by the official helm chart and specify the chainguard image as per below example:

```shell
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update

helm install cass-operator k8ssandra/cass-operator -n cass-operator
helm upgrade cass-operator \
    -n cass-operator \
    --set image.repository=cgr.dev/chainguard/cass-operator \
    --set image.tag=latest
    --wait \
    k8ssandra/cass-operator
}
```

As per [project documentation](https://github.com/k8ssandra/cass-operator/blob/master/README.md#installing-the-operator-with-helm), by default, the Helm installation requires cert-manager to be present in the Kubernetes installation. If you do not have cert-manager installed, follow the steps at (https://cert-manager.io/docs/installation/helm/)[cert-manager's] documentation.
<!--body:end-->
