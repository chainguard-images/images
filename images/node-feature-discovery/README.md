<!--monopod:start-->
# node-feature-directory
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/node-feature-directory` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/node-feature-directory/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A minimal wolfi-based image for node-feature-discovery, Node feature discovery for Kubernetes
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node-feature-directory:latest
```
<!--getting:end-->

<!--body:start-->
## Upstream documentation
For more information on node-feature-discovery, refer to the [node-feature-discovery documentation](https://kubernetes-sigs.github.io/node-feature-discovery/stable/get-started/index.html).
Additionally the node-feature-discovery GitHub reposiory can be [found here](https://github.com/kubernetes-sigs/node-feature-discovery).

## Helm
Node-feature-discovery can be deployed using the following helm chart:
- [https://artifacthub.io/packages/helm/node-feature-discovery/node-feature-discovery](https://artifacthub.io/packages/helm/node-feature-discovery/node-feature-discovery)

Follow the instructions in the link above to deploy node-feature-discovery using helm. Note you
will need to override the default image and tag used, replacing with the
chainguard image, example:

```bash
helm repo add node-feature-discovery https://kubernetes-sigs.github.io/node-feature-discovery/charts
helm repo update

export NFD_NS=node-feature-discovery
helm install nfd/node-feature-discovery --namespace $NFD_NS --create-namespace --generate-name \
  --set image.repository=cgr.dev/chainguard/node-feature-discovery \
  --set image.tag=latest
```

Refer to the [helm chart documentation](https://artifacthub.io/packages/helm/node-feature-discovery/node-feature-discovery)
for full instructions on how to use the helm chart.

<!--body:end-->
