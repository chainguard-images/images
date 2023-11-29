<!--monopod:start-->
# aws-load-balancer-controller
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/aws-load-balancer-controller` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/aws-load-balancer-controller/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal Image for Kubernetes controller for Elastic Load Balancers
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/aws-load-balancer-controller:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.
You can run it using the helm chart with:

```shell
$ helm repo add eks https://aws.github.io/eks-charts
$ helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    --set image.repository=cgr.dev/chainguard/aws-load-balancer-controller \
    --set image.tag=latest
    <other configuration parameters here>
```

Note that the `aws-load-balancer-controller` does need cloud provider configuration to work correctly, so it won't run locally.
See the [configuration](https://github.com/aws/eks-charts/tree/master/stable/aws-load-balancer-controller) docs for more examples.
<!--body:end-->
