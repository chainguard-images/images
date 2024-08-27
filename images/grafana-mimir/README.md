<!--monopod:start-->
# grafana-mimir
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana-mimir` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/grafana-mimir/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A minimal Wolfi-based image for Grafana Mimir, providing horizontally scalable, highly available, multi-tenant, long-term storage for Prometheus.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/grafana-mimir:latest
```
<!--getting:end-->

<!--body:start-->
### Usage

To get started with Grafana Mimir, add Grafana's Helm repository: 

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

Now deploy the Helm chart, substituting Grafana's image with Chainguard's:

```bash
helm install mimir grafana/mimir-distributed \
  --set image.repository=cgr.dev/chainguard/grafana-mimir \
  --set image.tag=latest
```

For additional configuration, please refer to the [upstream documentation](https://grafana.com/docs/helm-charts/mimir-distributed/latest/get-started-helm-charts/).
<!--body:end-->
