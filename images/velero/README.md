<!--monopod:start-->
# velero
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/velero` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/velero/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Backup and migrate Kubernetes applications and their persistent volumes
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/velero:latest
```
<!--getting:end-->

<!--body:start-->
[Velero] (https://velero.io/docs/v1.13/) (formerly Heptio Ark) gives you tools to back up and restore your Kubernetes cluster resources and persistent volumes. You can run Velero with a cloud provider or on-premises. \

Velero lets you:
* Take backups of your cluster and restore in case of loss.
* Migrate cluster resources to other clusters.
* Replicate your production cluster to development and testing clusters.

## Installation and Usage

```bash
docker run cgr.dev/chainguard/velero:latest help
```

For more information, refer to the velero documentation:
- [Velero GitHub](https://github.com/vmware-tanzu/velero)

When deploying velero helm charts with a kubectl image ensure to use
`-dev` tags as the velero upstream helm chart expects presence of `sh`
and `which` commands in the kubectl image. See this
[vmware-tanzu/helm-charts#591](https://github.com/vmware-tanzu/helm-charts/issues/591)
upstream issue. And at the same time kubectl images typically do not
ship with a `sh`.

<!--body:end-->
