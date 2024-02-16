<!--monopod:start-->
# prometheus-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based image for Prometheus Operator. Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-operator:latest
```
<!--getting:end-->

<!--body:start-->

## Usage
For full instructions on prometheus-operator, refer to the
[official documentation](https://prometheus-operator.dev).
The GitHub repository can also be [found here](https://github.com/prometheus-operator/prometheus-operator).

### Helm
To deploy via helm, please refer to the upstream
[helm charts documentation](https://github.com/prometheus-community/helm-charts)
for comprehensive instructions, which includes
[supported parameters](https://github.com/prometheus-community/helm-charts/blob/eef28b4b566c463242774814cfa5a94a9dec3e99/charts/kube-prometheus-stack/values.yaml#L2059)

Below is an example of how to use the helm chart, overriding the image with the
chainguard image:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prom-operator prometheus-community/kube-prometheus-stack \
 --set prometheusOperator.image.registry=cgr.dev \
 --set prometheusOperator.image.repository=chainguard/prometheus-operator \
 --set prometheusOperator.image.tag=latest
```
<!--body:end-->
