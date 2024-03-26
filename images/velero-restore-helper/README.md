<!--monopod:start-->
# velero-restore-helper
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/velero-restore-helper` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/velero-restore-helper/overview/)
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
docker pull cgr.dev/chainguard/velero-restore-helper:latest
```
<!--getting:end-->

<!--body:start-->
Velero uses a helper init container when performing a FSB restore. By default, the image for this container is velero/velero-restore-helper:<VERSION>, where VERSION matches the version/tag of the main Velero image. You can customize the image that is used for this helper by creating a ConfigMap in the Velero namespace with the alternate image.

## Installation and Usage

```bash
docker run cgr.dev/chainguard/velero-restore-helper:latest help
```

For more information, refer to the velero documentation:
- [Velero GitHub](https://github.com/vmware-tanzu/velero)
<!--body:end-->
