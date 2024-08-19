<!--monopod:start-->
# fluent-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/fluent-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/fluent-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Operator for Fluent Bit and Fluentd - previously known as FluentBit Operator
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/fluent-operator:latest
```
<!--getting:end-->

<!--body:start-->
The Fluent Operator is designed to deploy FluentBit Fluentd as a DaemonSet and StatefulSet respectively. It supports dynamic reconfiguration via CRDs and can be deployed using YAML or Helm.

To deploy the Chainguard Fluent Operator image, use the following Helm commands:

```
helm repo add fluent https://fluent.github.io/helm-charts
helm install fluent-operator \
    --create-namespace \
    -n fluent fluent/fluent-operator \
    --set operator.container.repository=cgr.dev/chainguard/fluent-operator \
    --set operator.container.tag=latest
```

Once the operator is deployed, follow the [Fluent Operator Walkthrough](https://github.com/kubesphere-sigs/fluent-operator-walkthrough) guides to configure FluentBit or Fluentd appropriately for your Kubernetes cluster.
<!--body:end-->
