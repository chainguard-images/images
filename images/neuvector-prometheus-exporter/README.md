<!--monopod:start-->
# neuvector-prometheus-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/neuvector-prometheus-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/neuvector-prometheus-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Prometheus exporter and Grafana template for NeuVector container security platform.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/neuvector-prometheus-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Add the NeuVector Helm repository to your repositories list:

```shell
helm repo add neuvector https://neuvector.github.io/neuvector-helm/
helm repo update
```

Next, install the NeuVector Prometheus Exporter with the following command:

```sh
helm install neuvector-prometheus-exporter neuvector/monitor \
    --namespace neuvector \
    --create-namespace \
    --set exporter.apiSvc=neuvector-svc-controller:10443 \
    --set exporter.image.repository=cgr.dev/chainguard/neuvector-prometheus-exporter \
    --set exporter.image.tag=<set to the latest chainguard tag>
```

Jump to the official [Helm Chart](https://github.com/neuvector/neuvector-helm/blob/master/charts/monitor/README.md) for more detailed usage.

P.S: The Exporter will not work without the NeuVector Core Service. Install the [neuvector/core](https://github.com/neuvector/neuvector-helm/tree/master/charts/core) first.

<!--body:end-->
