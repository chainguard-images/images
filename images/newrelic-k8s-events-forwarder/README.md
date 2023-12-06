<!--monopod:start-->
# newrelic-k8s-events-forwarder
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/newrelic-k8s-events-forwarder` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/newrelic-k8s-events-forwarder/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal [newrelic-k8s-events-forwarder](https://github.com/newrelic/nri-kubernetes) container image.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/newrelic-k8s-events-forwarder:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

These images are a drop-in replacement for the `newrelic` project. The images are tested against the upstream recommended [`nri-bundle`](https://github.com/newrelic/helm-charts/tree/master/charts/nri-bundle). chart.

A minimum sample of the `values.yaml` required to replace the installation with Chainguard Images is below:

> Note that `latest` is used below for brevity. In long term deployments this is discouraged.

```yaml
# minimal-values.yaml
global:
  cluster: $CLUSTER_NAME
  licenseKey: $LICENSE_KEY

newrelic-infrastructure:
  images:
    agent:
      registry: cgr.dev
      repository: chainguard/newrelic-infrastructure-bundle
      tag: latest
    integration:
      registry: cgr.dev
      repository: chainguard/newrelic-nri-kubernetes
      tag: latest

nri-prometheus:
  enabled: true
  image:
    registry: cgr.dev
    repository: chainguard/newrelic-nri-prometheus
    tag: latest

nri-kube-events:
  enabled: true
  images:
    integration:
      registry: cgr.dev
      repository: chainguard/newrelic-kube-events
      tag: latest
    agent:
      registry: cgr.dev
      repository: chainguard/newrelic-k8s-events-forwarder
      tag: latest

newrelic-logging:
  enabled: true
  image:
    repository: cgr.dev/chainguard/newrelic-fluent-bit-output
    tag: latest

newrelic-prometheus-agent:
  enabled: true
  images:
    configurator:
      registry: cgr.dev
      repository: chainguard/newrelic-prometheus-agent
      tag: latest
    prometheus:
      registry: cgr.dev
      repository: chainguard/prometheus
      tag: latest
```
<!--body:end-->
