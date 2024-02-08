<!--monopod:start-->
# keda
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/keda` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/keda/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with the Keda binary. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/keda:latest
```
<!--getting:end-->

<!--body:start-->
This image is a drop-in replacement for the KEDA manager available upstream at `ghcr.io/kedacore/keda`.
<!--body:end-->

## Usage

**TL;DR**

This chart bootstraps KEDA infrastructure on a Kubernetes cluster using the Helm package manager.

As part of that, it will install all the required Custom Resource Definitions (CRD).

```shell
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

kubectl create namespace keda
helm install keda kedacore/keda --namespace keda \
    --set image.keda.repository="developerguy/keda" \
    --set image.keda.tag="2.9" \
    --set image.pullPolicy=IfNotPresent --version 2.9.1
```
