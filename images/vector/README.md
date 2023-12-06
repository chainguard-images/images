<!--monopod:start-->
# vector
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/vector` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/vector/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [Vector](https://vector.dev/), a high-performance, end-to-end (agent & aggregator) observability data pipeline
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vector:latest
```
<!--getting:end-->

<!--body:start-->
## Testing

Fortunately, we have a Helm Chart ready-to-use for testing this image. 

You can find it [here](https://github.com/vectordotdev/helm-charts/blob/develop/charts/vector/README.md).

Basically, all you need to do is running the commands below to test the application:

```shell
helm repo add vector https://helm.vector.dev
helm repo update
helm install --name vector \
  --set image.registry=cgr.dev/ \
  --set image.repository=chainguard/vector \
  --set image.tag=latest
```

Once you run the commands above, you will end up having the application running on your cluster.
<!--body:end-->
