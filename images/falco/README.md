<!--monopod:start-->
# falco
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/falco` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/thanos-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Wolfi-based minimal image with the [falco](https://github.com/falcosecurity/falco).
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/falco:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```shell
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update
helm install falco falcosecurity/falco \
    --set image.repository=cgr.dev/chainguard/falco \
    --set image.tag=latest
```
<!--body:end-->
