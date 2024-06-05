<!--monopod:start-->
# prometheus-adapter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-adapter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-adapter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[prometheus-adapter](https://github.com/kubernetes-sigs/prometheus-adapter) is a Prometheus project used to collect Prometheus metrics in Kubernetes.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-adapter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus Adapter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install adapter prometheus-community/prometheus-adapter \
 --set image.repository=cgr.dev/chainguard/prometheus-adapter --set image.tag=latest
```

For more detail, please refer to the [Adapter documentation](https://github.com/kubernetes-sigs/prometheus-adapter).
<!--body:end-->
