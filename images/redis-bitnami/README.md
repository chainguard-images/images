<!--monopod:start-->
# redis-bitnami
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/redis-bitnami` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/redis-bitnami/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based [Redis-Bitnami]() image. This is intended to be a drop in replacement for deployments that require Bitnami compatibility. The most common case is the Bitnami Helm chart, which can be deployed as follows:

```bash
cat <<EOF > values.yaml
image:
  registry: cgr.dev
  repository: chainguard/redis-server-bitnami
  tag: latest
# Optinoally enable HA sentinel:
sentinel:
  enabled: true
  image:
    registry: cgr.dev
    repository: chainguard/redis-sentinel-bitnami
    tag: latest
EOF
```
