<!--monopod:start-->
# nri-kubernetes
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/nri-kubernetes` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/nri-kubernetes.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the New Relic Kubernetes Integration binary. **EXPERIMENTAL**

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nri-kubernetes:latest
```

This image is a drop-in replacement for the `nri-kubernetes` image available upstream at `newrelic/nri-kubernetes`.

You can run this in helm with:

```shell
helm upgrade \
    --install \
    newrelic-infrastructure nri-kubernetes/newrelic-infrastructure \
    --set images.integration.registry=cgr.dev \
    --set images.integration.repository=chainguard/nri-kubernetes \
    --set images.integration.tag="latest" \
    --set cluster=$CLUSTER --set licenseKey=$LICENSE_KEY
```

NOTE: This image requires a license key to run properly, which you can obtain from New Relic.

## Testing

The tests for this image also require a license key, which is configured in a secret in Github Actions.
