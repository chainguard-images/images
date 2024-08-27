<!--monopod:start-->
# velero-restore-helper
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/velero-restore-helper` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/velero-restore-helper/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

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
Velero uses a helper init container when performing a filesystem restore (FSB in Velero's terminology). To use this image as the helper follow the [File System Backup](https://velero.io/docs/main/file-system-backup/#customize-restore-helper-container) documentation, and edit the provided `ConfigMap` to use `cgr.dev/chainguard/velero-restore-helper`.

## Installation and Usage

```bash
docker run cgr.dev/chainguard/velero-restore-helper:latest help
```

For more information, refer to the velero documentation:
- [Velero GitHub](https://github.com/vmware-tanzu/velero)
<!--body:end-->
