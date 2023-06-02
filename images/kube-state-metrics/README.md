<!--monopod:start-->
# kube-state-metrics
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/kube-state-metrics` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kube-state-metrics/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Kube State Metrics Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kube-state-metrics:latest
```

## Usage

To test:

```shell
$ docker run cgr.dev/chainguard/kube-state-metrics
```

## Configuration

The image can be configured through flags.
Run it with the `--help` flag to see the full list:

```shell
$ docker run cgr.dev/chainguard/kube-state-metrics --help
kube-state-metrics is a simple service that listens to the Kubernetes API server and generates metrics about the state of the objects.

Usage:
  kube-state-metrics [flags]
  kube-state-metrics [command]

Available Commands:
  completion  Generate completion script for kube-state-metrics.
  help        Help about any command
  version     Print version information.

Flags:
```
