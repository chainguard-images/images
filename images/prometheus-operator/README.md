<!--monopod:start-->
# prometheus-operator
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-operator` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/prometheus-operator.svg) |

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
