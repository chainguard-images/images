<!--monopod:start-->
# rabbitmq-cluster-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/rabbitmq-cluster-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/rabbitmq-cluster-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
RabbitMQ Cluster Kubernetes Operator
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/rabbitmq-cluster-operator:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.
You can run it using kustomize with:

```shell
LATEST=$(curl -s "https://api.github.com/repos/rabbitmq/cluster-operator/releases/latest" | jq -r '.tag_name')

cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - "https://github.com/rabbitmq/cluster-operator/releases/download/${LATEST}/cluster-operator.yml"
patches:
  - patch: |
      - op: replace
        path: /spec/template/spec/containers/0/image
        value: cgr.dev/chainguard/rabbitmq-cluster-operator:latest
    target:
      version: v1
      kind: Deployment
      name: rabbitmq-cluster-operator
      namespace: rabbitmq-system
EOF

kubectl apply -f .
```
<!--body:end-->
