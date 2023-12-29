<!--monopod:start-->
# prometheus-alertmanager
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-alertmanager` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-alertmanager/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based image for Prometheus Alertmanager. Handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing to the correct receiver.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-alertmanager:latest
```
<!--getting:end-->

<!--body:start-->

## Usage
For full instructions on prometheus-alertmanager, refer to the
[official documentation](https://prometheus.io/docs/alerting/latest/alertmanager).
The GitHub repository can also be [found here](https://github.com/prometheus/alertmanager).

### Default config settings
The upstream docker image, overrides some of the default values for
alertmanager, for example, [see here](https://github.com/prometheus/alertmanager/blob/main/Dockerfile#L20).
We replicate the same behaviour in the chainguard image to provide parity with
the upstream image.

### Helm
To deploy via helm, please refer to the upstream
[helm charts documentation](https://github.com/prometheus-community/helm-charts)
for comprehensive instructions, which includes
[supported parameters](https://github.com/prometheus-community/helm-charts/blob/main/charts/alertmanager/values.yaml).

Below is an example of how to use the helm chart, overriding the image with the
chainguard image:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prom-alertmanager prometheus-community/alertmanager \
 --set image.repository=cgr.dev/chainguard/prometheus-alertmanager \
 --set image.tag=latest
```

The [upstream helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/alertmanager)
provides some default `config:` values, but if you intend to deploy with
additional configuration, i.e defining routes and receivers, you'll need to
create your own custom values.yaml and pass this into the chart at deployment.

### Docker

#### Create config file
Before running the container, you'll need to create a configuration file. This
contains all the necessary configurations for Alertmanager, such as alerting
routes, receivers, and integrations.

Refer to the [official documentation](https://prometheus.io/docs/alerting/latest/alertmanager)
for more information. Below is a simple example:

```yaml
# Save this as 'alertmanager.yml')
global:
  resolve_timeout: 11m
  pagerduty_url: https://example-pagerduty.com/v2/test
route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10m
  repeat_interval: 1h
receivers:
  - name: 'example-webhook'
    webhook_configs:
    - url: 'http://example.com/hook'
```

In order to ensure the 'nonroot' container user can access the file when
volume mounted (below step), ensure you've set read-only permissions:

```bash
chmod 400 alertmanager.ym
```

#### Run container

> **IMPORTANT**: Prometheus looks for a file mounted as 'alertmanager.yml' (i.e not .yaml).

```bash
# TODO: Update '$(pwd)/alertmanager.yml' accordingly to reference your locally
# created config file.
docker run -p 9093:9093 \
  -v $(pwd)/alertmanager.yml:/etc/alertmanager/alertmanager.yml \
  --name alertmanager \
  cgr.dev/chainguard/prometheus-alertmanager:latest
```

Verify that Alertmanager is running correctly by accessing http://localhost:9093
on your browser.

<!--body:end-->
