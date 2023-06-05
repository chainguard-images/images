<!--monopod:start-->
# prometheus-operator
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

## Try It Out

```sh
helm upgrade --install cg-test \
    prometheus-community/kube-prometheus-stack \
    --set prometheusOperator.image.repository=chainguard/prometheus-operator \
    --set prometheusOperator.image.registry=cgr.dev \
    --set prometheusOperator.image.tag=<set to the latest chainguard tag>
```

You'll want to make sure the `kube-prometheus-stack` chart is up-to-date and use the latest operator tag that's within the compatibility matrix.

## Known Deviations

The location of the operator binary changes in this image. This image uses

```sh
/usr/bin/operator
```

Upstream image uses

```sh
/bin/operator
```
