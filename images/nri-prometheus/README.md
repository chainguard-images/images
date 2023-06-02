<!--monopod:start-->
# nri-prometheus
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/nri-prometheus` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nri-prometheus/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the New Relic Prometheus Integration binary.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nri-prometheus:latest
```

This image is a drop-in replacement for the `nri-prometheus` image available upstream at `newrelic/nri-prometheus`.

You can run this in helm with:

```shell
helm upgrade \
    --install \
    newrelic-prometheus nri-prometheus/newrelic-prometheus \
    --set image.repository=cgr.dev/chainguard/nri-prometheus \
    --set image.integration.tag="latest" \
    --set cluster=$CLUSTER --set licenseKey=$LICENSE_KEY
```

NOTE: This image requires a license key to run properly, which you can obtain from New Relic.

## Testing

The tests for this image also require a license key, which is configured in a secret in Github Actions.
