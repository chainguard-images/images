<!--monopod:start-->
# prometheus-node-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-node-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-node-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Prometheus Node Exporter image for exporting node metrics.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-node-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus Node Exporter is to use the Helm chart.

Get the digest of the image, and then install the chart:

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install prom-node-exporter prometheus-community/prometheus-node-exporter \
 --set image.registry=cgr.dev \
 --set image.repository=chainguard/prometheus-node-exporter \
 --set image.digest=[DIGEST]
```

For more detail, please refer to the [Node Exporter documentation](https://github.com/prometheus/node_exporter).
<!--body:end-->
