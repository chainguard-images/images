<!--monopod:start-->
# grafana-agent-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana-agent-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/grafana-agent-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
[Grafana Agent Operator](https://grafana.com/docs/agent/latest/operator/) is a Kubernetes operator for the static mode of Grafana Agent.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/grafana-agent-operator:latest
```
<!--getting:end-->

<!--body:start-->

## Usage
For full instructions on grafana-agent-operator, refer to the
[official documentation](https://grafana.com/docs/agent/latest/operator/).
The GitHub repository can also be [found here](https://github.com/grafana/agent).

### Helm
To deploy via helm, please refer to the
[official helm charts documentation](https://grafana.com/docs/agent/latest/operator/helm-getting-started/) and the [helm charts repository](https://github.com/grafana/helm-charts/tree/main/charts/agent-operator)
for comprehensive instructions, which includes
[supported parameters](https://github.com/grafana/helm-charts/blob/main/charts/agent-operator/values.yaml)

Below is an example of how to use the helm chart, overriding the image with the
chainguard image:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install my-release grafana/grafana-agent-operator \
 --set image.registry=cgr.dev \
 --set image.repository=chainguard/grafana-agent-operator \
 --set image.tag=latest
```
<!--body:end-->
