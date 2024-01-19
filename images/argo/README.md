<!--monopod:start-->
# argo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/argo` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/argo/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Images for working with [Argo workflows](https://argoproj.github.io/argo-workflows/)
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/argo:latest
```
<!--getting:end-->

<!--body:start-->
## Versions

```
docker pull cgr.dev/chainguard/argo-exec
docker pull cgr.dev/chainguard/argo-cli
docker pull cgr.dev/chainguard/argo-workflowcontroller
```

## Using argo

Argo provides two upstream methods for installing, helm, and raw manifests.

The Chainguard Images for Argo are designed to be a drop in replacement for either method. To use them, simply replace the appropriate `image:` path with the Chainguard specific Argo image. Below is an example values file for doing this with helm:

```yaml

images:
  tag: "latest"
controller:
  image:
    # -- Registry to use for the controller
    registry: cgr.dev
    # -- Registry to use for the controller
    repository: chainguard/argo-workflow-controller
executor:
  image:
    # -- Registry to use for the Workflow Executors
    registry: cgr.dev
    # -- Repository to use for the Workflow Executors
    repository: chainguard/argo-exec
server:
  # -- Deploy the Argo Server
  image:
    # -- Registry to use for the server
    registry: cgr.dev
    # -- Repository to use for the server
    repository: chainguard/argo-cli
```

Using the above values, the helm commands become:

```bash
helm repo add argo https://argoproj.github.io/argo-helm

helm install argo-workflows argo/argo-workflows \
	--namespace argo-workflows \
	--create-namespace \
	--set images.tag="latest" \
	--set global.image.tag="latest" \
  --set controller.image.registry="cgr.dev" \
  --set controller.image.repository="chainguard/argo-workflow-controller" \
  --set executor.image.registry="cgr.dev" \
  --set executor.image.repository="chainguard/argo-exec" \
  --set server.image.registry="cgr.dev" \
  --set server.image.repository="chainguard/argo-cli"
```


> NOTE: Setting the tag to "latest" is not recommended, and only shown for illustrative purposes.
<!--body:end-->
