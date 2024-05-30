<!--monopod:start-->
# pluto
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pluto` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/pluto/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [pluto](https://github.com/FairwindsOps/pluto/) binary.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/pluto:latest
```
<!--getting:end-->

<!--body:start-->

## Testing the pluto Image

The following command will pull the image to your local system and automatically execute the `pluto version` command:

```shell
docker run --rm cgr.dev/chainguard/pluto version
```

This will return output similar to this.

```
Version:5.19.4 Commit:94d3acae30cd0c306a80fa42bb77a70b8f49e39c
```
<!--body:end-->
