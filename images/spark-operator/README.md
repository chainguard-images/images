<!--monopod:start-->
# spark-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/spark-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/spark-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A minimal, Wolfi-based image for Spark Operator. Facilitates the deployment and management of Apache Spark applications in Kubernetes environments.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/spark-operator:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

> Spark Operator expects to be deployed in a Kubernetes cluster, where an
> instance of Apache Spark is running, on which it will schedule jobs.


Installation using helm chart, replacing with the Chainguard image:

Below is an example of how to install the spark operator using helm, with the
chainguard image:

```bash
helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

helm install spark-operator spark-operator/spark-operator \
  --namespace spark \
  --create-namespace \
  --set image.repository=cgr.dev/chainguard/spark-operator \
  --set image.tag=latest
```

For more detail, please refer to the [Spark Operator installation documentation](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator?tab=readme-ov-file#installation).
<!--body:end-->
