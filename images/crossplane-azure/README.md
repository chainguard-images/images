<!--monopod:start-->
# crossplane-azure
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/crossplane-azure` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/crossplane-azure/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

These images provide Crossplane providers for Azure.

| Upstream Image | Chainguard Image |
| -------------- | ---------------- |
| `xpkg.upbound.io/upbound/provider-azure` | `cgr.dev/chainguard/crossplane-azure` |
| `xpkg.upbound.io/upbound/provider-azure-authorization` | `cgr.dev/chainguard/crossplane-azure-authorization` |
| `xpkg.upbound.io/upbound/provider-azure-managedidentity` | `cgr.dev/chainguard/crossplane-azure-managedidentity` |
| `xpkg.upbound.io/upbound/provider-azure-sql` | `cgr.dev/chainguard/crossplane-azure-sql` |
| `xpkg.upbound.io/upbound/provider-azure-storage` | `cgr.dev/chainguard/crossplane-azure-storage` |

You can use them by following the [Azure Quickstart](https://docs.crossplane.io/latest/getting-started/provider-azure/) and using the Chainguard image instead of the upstream image:

```yaml
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-azure-sql
spec:
  package: cgr.dev/chainguard/crossplane-azure-sql:latest
```
