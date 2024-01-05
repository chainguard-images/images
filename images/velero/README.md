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

<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/velero:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

Install with `helm` via the following values:

```yaml
# Sample only, do _not_ use in production
snapshotsEnabled: false

configuration:
  backupStorageLocation:
    - provider: aws
      bucket: velero
      # default: true
      config:
        region: minio
        s3ForcePathStyle: "true"
        s3Url: http://minio.velero.svc:9000

credentials:
  secretContents:
    cloud: |
      [default]
      aws_access_key_id = minio
      aws_secret_access_key = minio123

initContainers:
  - name: velero-plugin-for-aws
    image: velero/velero-plugin-for-aws:v1.8.0
    imagePullPolicy: Always
    volumeMounts:
      - mountPath: /target
        name: plugins
```

<!--body:end-->
