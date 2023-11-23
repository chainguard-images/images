<!--monopod:start-->
# prometheus-mongodb-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-mongodb-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-mongodb-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Prometheus MongoDB Exporter image for exporting various metrics about MongoDB.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-mongodb-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus MongoDB Exporter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install prom-mongodb-exporter prometheus-community/prometheus-mongodb-exporter \
 --set image.repository=cgr.dev/chainguard/prometheus-mongodb-exporter --set image.tag=latest
```

For more detail, please refer to the [MongoDB Exporter documentation](https://github.com/percona/mongodb_exporter).
<!--body:end-->
