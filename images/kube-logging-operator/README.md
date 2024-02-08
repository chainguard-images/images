<!--monopod:start-->
# kube-logging-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kube-logging-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kube-logging-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal Logging operator for Kubernetes Image
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kube-logging-operator:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

To test:

```shell
$ docker run cgr.dev/chainguard-private/kube-logging-operator
```

With `Helm`:

```shell
helm repo add kube-logging https://kube-logging.dev/helm-charts
helm repo update
helm upgrade --install logging-operator kube-logging/logging-operator \
    --set image.repository=cgr.dev/chainguard-private/kube-logging-operator \
    --set image.tag=$VERSION
```

<!--body:end-->