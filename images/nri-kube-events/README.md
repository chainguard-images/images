<!--monopod:start-->
# nri-kube-events
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/nri-kube-events` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/nri-kube-events.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the [nri-kube-events](https://github.com/newrelic/nri-kube-events) binary.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nri-kube-events:latest
```

This image is a drop-in replacement for the `nri-kube-events` image available upstream at `newrelic/nnri-kube-events`.

## Usage

```
Usage of /usr/bin/nri-kube-events:
  -config string
        location of the configuration file (default "config.yaml")
  -kubeconfig string
        location of the k8s configuration file. Usually in ~/.kube/config
  -loglevel string
        Log level: [warning, info, debug] (default "info")
  -promaddr string
        Address to serve prometheus metrics on (default "0.0.0.0:8080")
```

You can run this in helm with:

```shell
helm repo add nri-kube-events https://newrelic.github.io/nri-kube-events
helm upgrade \
    --install \
    nri-kube-events nri-kube-events/nri-kube-events \
    --set images.integration.registry=cgr.dev \
    --set images.integration.repository=chainguard/nri-kube-events \
    --set images.integration.tag="latest" \
    --set cluster=$CLUSTER --set licenseKey=$LICENSE_KEY
```

NOTE: This image requires a license key to run properly, which you can obtain from New Relic.

## Testing

The tests for this image also require a license key, which is configured in a secret in Github Actions.
