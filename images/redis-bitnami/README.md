<!--monopod:start-->
# redis (bitnami)
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/redis-bitnami` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/redis/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Wolfi-based [Redis Bitnami](https://bitnami.com/stack/redis/helm) image. See [here](../redis/README.md) for the Wolfi based official Redis.

These images and variants exist to be a drop in replacement for the Bitnami Redis images, primarily deployed through the helm chart:

```shell
cat > values.yaml <<EOF
image:
  registry: cgr.dev
  repository: chainguard/redis-bitnami
  tag: latest

# Enable for HA variant
sentinel:
  enabled: true
  image:
    registry: cgr.dev
    repository: chainguard/redis-bitnami-sentinel
    tag: latest
EOF

helm install my-release oci://registry-1.docker.io/bitnamicharts/redis -f values.yaml
```
