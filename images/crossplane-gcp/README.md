<!--monopod:start-->
# crossplane-gcp
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/crossplane-gcp` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/crossplane-gcp/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Crossplane lets you build a control plane with Kubernetes-style declarative and API-driven configuration and management for anything.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/crossplane-gcp:latest
```
<!--getting:end-->

<!--body:start-->
These images provide Crossplane providers for gcp.

| Upstream Image | Chainguard Image |
| -------------- | ---------------- |
| `xpkg.upbound.io/upbound/provider-gcp` | `cgr.dev/chainguard/crossplane-gcp` |
| `xpkg.upbound.io/upbound/provider-gcp-storage` | `cgr.dev/chainguard/crossplane-gcp-storage` |
| `xpkg.upbound.io/upbound/provider-gcp-pubsub` | `cgr.dev/chainguard/crossplane-gcp-pubsub` |

You can use them by following the [GCP Quickstart](https://docs.crossplane.io/latest/getting-started/provider-gcp/) and using the Chainguard image instead of the upstream image:

```yaml
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-gcp-storage
spec:
  package: cgr.dev/chainguard/crossplane-gcp-storage:latest
```
<!--body:end-->
