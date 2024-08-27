<!--monopod:start-->
# argocd
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/argocd` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/argocd/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
[Argo CD](https://argo-cd.readthedocs.io/en/stable/) is a declarative continuous deployment tool for Kubernetes.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/argocd:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

There are two recommended methods for installing Argo CD: using `helm` and raw manifests. Chainguard's Argo CD Image is designed to be a drop-in replacement for either method.

To use this Image, replace the appropriate `image:` value with the Chainguard Argo CD Image. The following is an example how such a value might appear within a Helm chart:

```yaml
global:
  image:
    repository: cgr.dev/chainguard/argocd
```

Based on these values, you would install Argo CD using the following `helm` commands. First, add the Argo Helm repository:

```bash
helm repo add argo https://argoproj.github.io/argo-helm
```

Then you can install Argo CD:

```bash
helm install argocd argo/argo-cd \
	--namespace argocd \
	--create-namespace \
	--set global.image.repository="cgr.dev/chainguard/argocd" \
	--set global.image.tag="latest" \
	--set repoServer.image.repository="cgr.dev/chainguard/argocd-repo-server" \
	--set repoServer.image.tag="latest"
```

Note that this example uses multiple container images, namely `argocd` and `argocd-repo-server`. Refer to the following [components](#argocd-components) section for more information.

> NOTE: Setting the tag to `latest` is not recommended, and only shown for illustrative purposes.

Optionally, you can use other Chainguard Images to replace Argo CD dependencies:

```yaml
redis:
  image:
    repository: cgr.dev/chainguard/redis
    tag: latest

dex:
  image:
    repository: cgr.dev/chainguard/dex
    tag: latest
```

### Argo CD Components

Argo CD is comprised of multiple [components](https://argo-cd.readthedocs.io/en/stable/operator-manual/architecture/#components) that all share the same container image.

Keeping in line with the philosophy of minimal dependencies in Chainguard Images, we chose to split this up to keep the number of packages in each respective component to a minimum. This means the overall number of images increases, but the size and complexity of each image is reduced down to the minimum needed to function.
<!--body:end-->
