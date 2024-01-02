<!--monopod:start-->
# cert-exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cert-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cert-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A minimal, wolfi-based image for cert-exporter: an application that exports certificate expiration metrics from disk, Kubernetes, and AWS Secrets Manager to Prometheus.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cert-exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage
For full instructions on how to run cert-exporter, please refer to the upstream
GitHub repositories [documentation](https://github.com/joe-elliott/cert-exporter).

> **NOTE:** cert-exporter is intended to run inside a Kubernetes cluster. If you
> attempt to run locally, it'll hang and doesn't print anything to the logs.

### Helm
To deploy via helm, please refer to the upstream
[helm charts documentation](https://github.com/joe-elliott/cert-exporter/tree/master/helm/cert-exporter)
for comprehensive instructions, which includes
[supported parameters](https://github.com/joe-elliott/cert-exporter/blob/master/helm/cert-exporter/values.yaml).

Below is an example of how to use the helm chart, overriding the image with the
chainguard image:

```bash
helm repo add cert-exporter https://joe-elliott.github.io/cert-exporter/

# The chart will error if this doesn't already exist, however it does not use this ns directly.
kubectl create namespace monitoring

helm install cert-exporter cert-exporter/cert-exporter  \
 --set image.repository=cgr.dev/chainguard/cert-exporter \
 --set image.tag=latest
```
<!--body:end-->
