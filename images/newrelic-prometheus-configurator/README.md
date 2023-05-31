<!--monopod:start-->
# newrelic-prometheus-configurator
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/newrelic-prometheus-configurator` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/newrelic-prometheus-configurator.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal [New Relic Prometheus Configurator](https://github.com/newrelic/newrelic-prometheus-configurator) container image.

## Get It

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/newrelic-prometheus-configurator
```

## Usage

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/newrelic-prometheus-configurator:latest
```

This image is a drop-in replacement for the `newrelic-prometheus-configurator` image available upstream at `newrelic/newrelic-prometheus-configurator`.

You can run this in Helm with:

```bash
helm repo add newrelic-prometheus https://newrelic.github.io/newrelic-prometheus-configurator

helm upgrade --install newrelic newrelic-prometheus/newrelic-prometheus-agent \
    --namespace newrelic \
    --create-namespace \
    --set images.configurator.repository=cgr.dev/chainguard/newrelic-prometheus-configurator \
    --set images.configurator.integration.tag="latest" \
    --set cluster=$CLUSTER \
    --set licenseKey=$LICENSE_KEY
```

NOTE: This image requires a license key to run properly, which you can obtain from New Relic.

## Testing

The tests for this image also require a license key, which is configured in a secret in Github Actions.
