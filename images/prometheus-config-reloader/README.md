<!--monopod:start-->
# prometheus-config-reloader
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-config-reloader` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/prometheus-config-reloader.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

## Try It Out

```sh
helm upgrade --install cg-test \
    prometheus-community/kube-prometheus-stack \
    --set prometheusOperator.prometheusConfigReloader.image.repository=chainguard/prometheus-config-reloader \
    --set prometheusOperator.prometheusConfigReloader.image.registry=cgr.dev \
    --set prometheusOperator.prometheusConfigReloader.image.tag=<set to the latest chainguard tag>
```

You'll want to make sure the `kube-prometheus-stack` chart is up-to-date and use the latest operator tag that's within the compatibility matrix.
