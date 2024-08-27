<!--monopod:start-->
# prometheus-node-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-node-exporter` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/prometheus-node-exporter/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Prometheus Node Exporter image for exporting node metrics.
<!--overview:end-->

<!--getting:start-->
## Download this Image
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
