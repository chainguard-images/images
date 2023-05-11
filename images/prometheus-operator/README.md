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

## Known Deviations

The location of the operator binary changes in this image. This image uses

```sh
/usr/bin/operator
```

Upstream image uses

```sh
/bin/operator
```
