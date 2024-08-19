<!--monopod:start-->
# grafana-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/grafana-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A Wolfi-powered operator for Grafana that installs and manages Grafana instances, Dashboards and Datasources.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/grafana-operator:latest
```
<!--getting:end-->

<!--body:start-->
# Usage

Use `kubectl` to create a namespace to be used by Grafana Operator:

```bash
kubectl create ns grafana-operator
```

Deploy Grafana Operator within the namespace with the Helm chart:

```bash
  helm upgrade \
    -n grafana-operator \
    -i grafana-operator oci://ghcr.io/grafana/helm-charts/grafana-operator \
    --version v5.8.1 \
    --set image.repository=cgr.dev/chainguard/grafana-operator \
    --set image.tag=latest
```

Note that the upstream chart is not tagged with `latest` so we need to set the version explicitly. Always use the [latest supported version of the chart](https://grafana.github.io/grafana-operator/docs/installation/helm/).

We can verify that the operator is available by checking for the service:

```bash
kubectl get svc -n grafana-operator
```

You've now successfully deployed Grafana Operator! For more documentation, checkout the official docs [here](https://grafana.github.io/grafana-operator/docs/).

<!--body:end-->
