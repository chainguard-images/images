<!--monopod:start-->
# neuvector-enforcer
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/neuvector-enforcer` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/neuvector-enforcer/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Neuvector pod scanner for Neuvector Suite
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/neuvector-enforcer:latest
```
<!--getting:end-->

<!--body:start-->
Add the NeuVector Helm repository to your repositories list:

```shell
helm repo add neuvector https://neuvector.github.io/neuvector-helm/
helm repo update
```

Next, install the NeuVector Scanner with the following command:
```sh
helm install neuvector-enforcer neuvector/core \
    --namespace neuvector \
    --create-namespace \
    --set enforcer.image.repository=cgr.dev/chainguard/neuvector-enforcer \
    --set enforcer.image.tag=<set to the latest chainguard tag>
```

Jump to the official [Helm Chart](https://github.com/neuvector/neuvector-helm/blob/master/charts/core/README.md) for more detailed usage.
<!--body:end-->
