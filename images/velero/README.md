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

To install Velero, you can use the following command:

```bash
apk add velero velero-compat velero-restore-helper
```

Then, you can install Velero into your Kubernetes cluster using the velero install command:

```bash
velero install --namespace velero \
               --no-default-backup-location \
               --use-volume-snapshots=false \
               --no-secret \
               --image ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}
```

Once Velero is installed, you can start using it to create backups and restore them:
```bash
velero backup create my-backup --include-namespaces default

velero restore create --from-backup my-backup

velero restore get my-backup
```


```bash
docker run cgr.dev/chainguard/velero:latest help
```

For more information, refer to the velero documentation:
- [Velero GitHub](https://github.com/vmware-tanzu/velero)
<!--body:end-->
