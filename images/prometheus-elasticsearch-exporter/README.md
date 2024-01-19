<!--monopod:start-->
# prometheus-elasticsearch-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-elasticsearch-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-elasticsearch-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Prometheus Elasticsearch Exporter image for exporting various metrics about Elasticsearch.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-elasticsearch-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus Elasticsearch Exporter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install prom-elasticsearch-exporter prometheus-community/prometheus-elasticsearch-exporter \
 --set image.repository=cgr.dev/chainguard/prometheus-elasticsearch-exporter --set image.tag=latest
```

For more detail, please refer to the [Elasticsearch Exporter documentation](https://github.com/prometheus-community/elasticsearch_exporter).
<!--body:end-->
