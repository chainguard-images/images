<!--monopod:start-->
# prometheus-cloudwatch-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-cloudwatch-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-cloudwatch-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Prometheus CloudWatch Exporter image for exporting metrics to Amazon AWS CloudWatch.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-cloudwatch-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus StatsD Exporter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install prom-cloudwatch-exporter prometheus-community/prometheus-cloudwatch-exporter \
 --set image.repository=cgr.dev/chainguard/prometheus-cloudwatch-exporter --set image.tag=latest
```

For more detail, please refer to the [CloudWatch Exporter documentation](https://github.com/prometheus/cloudwatch_exporter).
<!--body:end-->
