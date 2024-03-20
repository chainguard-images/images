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

Then, you can install Velero into your Kubernetes cluster using the follwing steps:

1. Deploy Minio for Velero's backup storage:

```bash
kubectl apply -f https://raw.githubusercontent.com/vmware-tanzu/velero/main/examples/minio/00-minio-deployment.yaml
```

2. Create a credentials file for Minio:

```bash
cat <<EOF > credentials-velero
  [default]
  aws_access_key_id = minio
  aws_secret_access_key = minio123
EOF
```

3. Use velero install command with necessary flags.
```bash
velero install --bucket velero \
                 --secret-file ./credentials-velero \
                 --use-volume-snapshots=false \
                 --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000 \
                 --provider aws \
                 --plugins velero/velero-plugin-for-aws:v1.9.1 \
                 --image ${IMAGE_REGISTRY}/${IMAGE_REPOSITORY}:${IMAGE_TAG}
```

Once Velero is installed, you can start using it to create backups and restore them:

```bash
velero backup create nfs-server-backup \
    --include-namespaces nfs-server \
    --default-volumes-to-fs-backup \
    --wait

velero restore create --from-backup nfs-server-backup

velero restore get nfs-server-backup
```


```bash
docker run cgr.dev/chainguard/velero:latest help
```

For more information, refer to the velero documentation:
- [Velero GitHub](https://github.com/vmware-tanzu/velero)
<!--body:end-->
