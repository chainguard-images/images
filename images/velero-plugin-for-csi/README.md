<!--monopod:start-->
# velero-plugin-for-csi
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/velero-plugin-for-csi` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/velero-plugin-for-csi/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Velero plugins for integrating with CSI snapshot API
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/velero-plugin-for-csi:latest
```
<!--getting:end-->

<!--body:start-->

# Usage

To get more detail about how to use this plugin, please refer to the [Container Storage Interface Snapshot Support in Velero
](https://velero.io/docs/v1.13/csi/).

To integrate Velero with the CSI volume snapshot APIs, you must enable the EnableCSI feature flag and install the Velero CSI plugins on the Velero server.

Both of these can be added with the velero install command.

```
velero install \
--features=EnableCSI \
--plugins=<object storage plugin>,cgr.dev/chainguard/velero-plugin-for-csi:latest \
...
```

For the object storage plugin, you can use the appropriate object storage plugin for your cloud provider. For example, for AWS, you can use the AWS plugin available in Chainguard image catalog: **cgr.dev/chainguard/velero-plugin-for-aws:latest**


<!--body:end-->
