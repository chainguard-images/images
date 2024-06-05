<!--monopod:start-->
# postgres-helm-compat
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/postgres-helm-compat` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/postgres-helm-compat/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
PostgreSQL image compatible with helm charts.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/postgres-helm-compat:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a variant of [PostgreSQL](../postgres/README.md) that is compatible with Helm charts.

To install it, use the following values:

```bash
helm install postgresql postgresql --repo oci://registry-1.docker.io/bitnamicharts --values - <<EOF
image:
  registry: cgr.dev
  repository: chainguard/postgres-helm-compat
EOF
```

<!--body:end-->
