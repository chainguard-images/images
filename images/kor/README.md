<!--monopod:start-->
# kor
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kor` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kor/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A Golang Tool to discover unused Kubernetes Resources
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kor:latest
```
<!--getting:end-->

<!--body:start-->
# Kor - Kubernetes Orphaned Resources Finder

Kor is a tool to discover unused Kubernetes resources. Currently, Kor can identify and list unused:
- ConfigMaps  
- Secrets
- Services
- ServiceAccounts
- Deployments
- StatefulSets
- Roles
- HPAs
- PVCs
- Ingresses
- PDBs
- CRDs

![Kor Screenshot](/images/screenshot.png)

for more information refer [kor](https://github.com/yonahd/kor)

## Installation

### Docker
Run a container with your kubeconfig mounted:
```sh
docker run --rm -i cgr.dev/chainguard/kor:latest

docker run --rm -i -v "/path/to/.kube/config:/root/.kube/config" cgr.dev/chainguard/kor:latest all
```

### Helm
Run as a cronjob in your Cluster (with an option for sending slack updates)

```sh
git clone https://github.com/yonahd/kor.git
```

```sh
helm upgrade --install kor \
    --namespace kor \
    --create-namespace \
    --set cronJob.enabled=true \
    --set cronJob.image.repository=cgr.dev/chainguard/kor \
    --set cronJob.image.tag=latest \
    --set prometheusExporter.enabled=true \
    --set prometheusExporter.deployment.image.repository=cgr.dev/chainguard/kor \
    --set prometheusExporter.deployment.image.tag=latest \
    --wait \
    --timeout=300s \
    ./kor/charts/kor
```
<!--body:end-->
