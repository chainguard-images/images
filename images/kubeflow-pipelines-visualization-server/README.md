<!--monopod:start-->
# kubeflow-pipelines-visualization-server
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubeflow-pipelines-visualization-server` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubeflow-pipelines-visualization-server/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [ml-pipeline/visualization-server](https://github.com/kubeflow/pipelines/tree/master/backend/src/apiserver/visualization).
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubeflow-pipelines-visualization-server:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream `ml-pipeline/visualization-server` image.

To try it out, follow the [official installation
instructions](https://github.com/kubeflow/pipelines/tree/master/backend/src/apiserver/visualization#how-to-create-predefined-visualizations).

Please also notice the [known limitations](https://github.com/kubeflow/pipelines/tree/master/backend/src/apiserver/visualization#known-limitations) as described in the upstream documentation.
<!--body:end-->
