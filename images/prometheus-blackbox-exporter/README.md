<!--monopod:start-->
# prometheus-blackbox-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-blackbox-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-blackbox-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Prometheus blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP, ICMP and gRPC.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-blackbox-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Prometheus Blackbox exporter is to use the Helm chart.

```bash
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install blackbox-exporter prometheus-community/prometheus-blackbox-exporter \
 --set image.registry=cgr.dev \
 --set image.repository=chainguard/prometheus-blackbox-exporter \
 --set image.tag=latest
```

For more detail, please refer to the [Blackbox exporter documentation](https://github.com/prometheus/blackbox_exporter).
<!--body:end-->
