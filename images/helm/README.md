<!--monopod:start-->
# helm
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/helm` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/helm/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [helm](https://helm.sh) binary. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/helm:latest
```
<!--getting:end-->

<!--body:start-->

## Testing the Helm Image

The following command will pull the image to your local system and automatically execute the `helm version` command:

```shell
docker run --rm  cgr.dev/chainguard/helm version
```

This will return output similar to this.

```
version.BuildInfo{Version:"v3.13.2", GitCommit:"2a2fb3b98829f1e0be6fb18af2f6599e0f4e8243", GitTreeState:"clean", GoVersion:"go1.21.4"}
```
<!--body:end-->
