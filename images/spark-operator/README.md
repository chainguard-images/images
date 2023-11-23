<!--monopod:start-->
# spark-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/spark-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/spark-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Spark Operator image for managing the lifecycle of Apache Spark applications on Kubernetes.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/spark-operator:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The easiest way to install the Kubernetes Operator for Apache Spark is to use the Helm chart.

```bash
$ helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

$ helm install my-release spark-operator/spark-operator --namespace spark-operator --create-namespace --set image.repository=cgr.dev/chainguard/spark-operator --set image.tag=latest
```

For more detail, please refer to the [Spark Operator installation documentation](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator?tab=readme-ov-file#installation).
<!--body:end-->
