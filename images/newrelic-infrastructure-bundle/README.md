<!--monopod:start-->
# newrelic-infrastructure-bundle
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/newrelic-infrastructure-bundle` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/newrelic-infrastructure-bundle/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal [newrelic-infrastructure-bundle](https://github.com/newrelic/infrastructure-bundle) container image.

## Get It

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/newrelic-infrastructure-bundle
```

## Usage

This image is a drop-in replacement for the `newrelic-infrastructure-bundle` project that image known as and available upstream at `newrelic/infrastructure-bundle`.

You can run this in Helm with:

```shell
helm repo add nri-kubernetes https://newrelic.github.io/nri-kubernetes

helm upgrade --install newrelic-infrastructure-bundle nri-kubernetes/newrelic-infrastructure \
    --set images.agent.registry=cgr.dev \
    --set images.agent.repository=chainguard/newrelic-infrastructure-bundle \
    --set images.agent.tag=latest \
    --set images.integration.registry=cgr.dev \
    --set images.integration.repository=chainguard/nri-kube-events \
    --set images.integration.tag="latest" \
    --set cluster=$CLUSTER --set licenseKey=$LICENSE_KEY
```

NOTE: This image requires a license key to run properly, which you can obtain from New Relic.

## Testing

The tests for this image also require a license key, which is configured in a secret in Github Actions.
