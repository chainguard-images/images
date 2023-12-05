<!--monopod:start-->
# prometheus-postgres-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-postgres-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-postgres-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A PostgreSQL metric exporter for Prometheus
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-postgres-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus Prometheus Exporter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install prom-postgres-exporter prometheus-community/prometheus-postgres-exporter \
 --set image.repository=cgr.dev/chainguard/prometheus-postgres-exporter --set image.tag=latest
```

For more detail, please refer to the [Postgres Exporter documentation](https://github.com/prometheus-community/postgres_exporter).
<!--body:end-->
