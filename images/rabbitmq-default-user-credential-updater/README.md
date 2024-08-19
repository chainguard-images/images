<!--monopod:start-->
# rabbitmq-default-user-credential-updater
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/rabbitmq-default-user-credential-updater` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/rabbitmq-default-user-credential-updater/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [default-user-credential-updater](https://github.com/rabbitmq/default-user-credential-updater)
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/rabbitmq-default-user-credential-updater:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.
For example, you can run it using the upstream RabbitMQ Cluster Operator deployment by
defining the `DEFAULT_USER_UPDATER_IMAGE` environment variable:

```shell
cat <<EOF > kustomization.yaml
resources:
- https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml
patches:
- patch: |-
    - op: add
      path: "/spec/template/spec/containers/0/env/-"
      value: 
        name: DEFAULT_USER_UPDATER_IMAGE
        value: cgr.dev/chainguard/rabbitmq-default-user-credential-updater:latest
  target:
    kind: Deployment
    namespace: rabbitmq-system
    name: rabbitmq-cluster-operator
EOF

kustomize build . | kubectl apply -f -
```
<!--body:end-->
