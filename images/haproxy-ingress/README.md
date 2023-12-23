<!--monopod:start-->
# haproxy-ingress
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/haproxy-ingress` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/haproxy-ingress/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Kubernetes ingress controller implementation for HAProxy
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/haproxy-ingress:latest
```
<!--getting:end-->

<!--body:start-->
# Use It!

You can use this image with the `haproxy-ingress` project's [Helm chart](https://artifacthub.io/packages/helm/haproxy-ingress/haproxy-ingress). To begin, add the Helm chart's repository.

```shell
helm repo add haproxy-ingress https://haproxy-ingress.github.io/charts
```

Then run the following command to retrieve the latest information about the charts in the repository you just added.

```shell
helm repo update
```

Then install `haproxy-ingress` with the following command. This command directs Helm to install it using Chainguard's `haprox-ingress:latest` image.

```shell
helm install ingress haproxy-ingress/haproxy-ingress \
  --set controller.image.repository="cgr.dev/chainguard/haproxy-ingress" \
  --set controller.image.tag="latest"
```

Run the following command to confirm that the the Pod is running and ready to use.

```shell
kubectl wait --for=condition=ready pod --selector "app.kubernetes.io/name=haproxy-ingress" --timeout=120s
```
<!--body:end-->
