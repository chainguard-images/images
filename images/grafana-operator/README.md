<!--monopod:start-->
# grafana-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/grafana-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist [grafana-operator](https://github.com/grafana-operator/grafana-operator) image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/grafana-operator:latest
```

## Usage

Please refer to the [official documentation](https://github.com/grafana-operator/grafana-operator/blob/master/deploy/helm/grafana-operator/README.md).

```
helm upgrade --install grafana-operator oci://ghcr.io/grafana-operator/helm-charts/grafana-operator \
  --set image.repository=cgr.dev/chainguard/grafana-operator \
  --set image.tag=latest
```