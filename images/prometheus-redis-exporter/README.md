<!--monopod:start-->
# prometheus-redis-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-redis-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-redis-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Prometheus Redis Exporter image for exporting metrics to Redis.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-redis-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus Redis Exporter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install prom-redis-exporter prometheus-community/prometheus-redis-exporter \
 --set image.repository=cgr.dev/chainguard/prometheus-redis-exporter --set image.tag=latest
```

For more detail, please refer to the [Redis Exporter documentation](https://github.com/oliver006/redis_exporter).
<!--body:end-->
