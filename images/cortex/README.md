<!--monopod:start-->
# cortex
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cortex` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/cortex/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Cortex provides horizontally scalable, highly available, multi-tenant, long term storage for Prometheus.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cortex:latest
```
<!--getting:end-->

<!--body:start-->

## Usage
For full instructions on using cortex, refer to the
[official documentation](https://cortexmetrics.io/docs/).
The GitHub repository can also be [found here](https://github.com/cortexproject/cortex).

### Helm
To deploy cortex via helm, please refer to the
[official helm charts documentation](https://cortexproject.github.io/cortex-helm-chart/) and the [helm charts repository](https://github.com/cortexproject/cortex-helm-chart)
for comprehensive instructions, which includes
[supported parameters](https://github.com/cortexproject/cortex-helm-chart/blob/master/values.yaml)

Below is an example of how to use the helm chart, overriding the image with the
chainguard image:

```bash
helm repo add cortex-helm https://cortexproject.github.io/cortex-helm-chart
helm repo update

helm install cortex --namespace cortex cortex-helm/cortex \
 --set image.repository=cgr.dev/chainguard/cortex \
 --set image.tag=latest
```
<!--body:end-->
