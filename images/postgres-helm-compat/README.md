<!--monopod:start-->
# postgres-helm-compat
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/postgres-helm-compat` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/postgres-helm-compat/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
PostgreSQL image compatible with helm charts.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/postgres-helm-compat:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a variant of [PostgreSQL](https://images.chainguard.dev/directory/image/postgres/versions) that is compatible with Helm charts.

To install it, use the following values:

```bash
helm install postgresql postgresql --repo oci://registry-1.docker.io/bitnamicharts --values - <<EOF
image:
  registry: cgr.dev
  repository: chainguard/postgres-helm-compat
EOF
```

<!--body:end-->
