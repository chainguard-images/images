<!--monopod:start-->
# kubernetes-event-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-event-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubernetes-event-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist [wolfi](https://github.com/wolfi-dev)-based image of [Kubernetes Event Exporter](https://github.com/resmoio/kubernetes-event-exporter) for exporting Kubernetes events to various outputs to be used for observability or alerting purposes.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-event-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Project documentation suggests usage of Bitnami chart which is comprehensive.

This chart bootstraps a Kubernetes Event Exporter deployment on a Kubernetes cluster using 
the Helm package manager.

To install the chart with the release name my-release:

```
helm install my-release oci://registry-1.docker.io/bitnamicharts/kubernetes-event-exporter

helm upgrade my-release oci://registry-1.docker.io/bitnamicharts/kubernetes-event-exporter \
  --set image.repository=cgr.dev/chainguard/kubernetes-event-exporter \
  --set image.tag=latest

```

To uninstall/delete this deployment:

```
helm delete my-release
```
<!--body:end-->
