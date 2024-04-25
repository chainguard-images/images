<!--monopod:start-->
# neuvector-scanner
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/neuvector-scanner` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/neuvector-scanner/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
NeuVector vulnerability scanner for the SUSE NeuVector Container Security Platform
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/neuvector-scanner:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Add the NeuVector Helm repository to your repositories list:

```shell
helm repo add neuvector https://neuvector.github.io/neuvector-helm/
helm repo update
```

Next, install the NeuVector Scanner with the following command:

```sh
helm install my-release --namespace neuvector
```

Jump to the official [Helm Chart](https://github.com/neuvector/neuvector-helm/blob/master/charts/core/README.md) for more detailed usage.

<!--body:end-->
