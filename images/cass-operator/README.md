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
A minimal, wolfi-based image for [cass-operator](https://github.com/k8ssandra/cass-operator).

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

```shell
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update
helm install cass-operator k8ssandra/cass-operator-operator \
    -n cass-operator --create-namespace \
    --set image.repository=cgr.dev/chainguard/thanos-operator \
    --set image.tag=latest
```
<!--body:end-->
