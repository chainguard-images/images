<!--monopod:start-->
# velero-plugin-for-aws
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/velero-plugin-for-aws` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/velero-plugin-for-aws/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Plugins to support Velero on AWS
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/velero-plugin-for-aws:latest
```
<!--getting:end-->

<!--body:start-->

##  Usage

The [Velero plugin for AWS documentation](https://velero.io/plugins/) can be found on Velero's official website. We encourage you to check out our guide on [getting started with Velero plugin for AWS](https://github.com/vmware-tanzu/velero-plugin-for-aws#setup) which demonstrates how you can use Velero plugin for AWS image to backup and restore your Kubernetes cluster resources to AWS S3.

Do not forget to replace the `velero/velero-plugin-for-aws` image with `cgr.dev/chainguard/velero-plugin-for-aws` in the Velero's install command.

```bash
$ velero install \
    --provider aws \
    --plugins cgr.dev/chainguard/velero-plugin-for-aws:latest \
   ...
```
<!--body:end-->
