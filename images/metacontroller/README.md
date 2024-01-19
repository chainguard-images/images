<!--monopod:start-->
# metacontroller
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/metacontroller` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/metacontroller/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal Metacontroller Image
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/metacontroller:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.
You can run it using the helm chart with:

```shell
$ export HELM_EXPERIMENTAL_OCI=1
$ helm install my-metacontroller-helm oci://ghcr.io/metacontroller/metacontroller-helm --version v4.10.3  \
    --set image.repository=cgr.dev/chainguard/metacontroller \
    --set image.tag=latest \
    <other configuration parameters here>
```

See the [configuration](https://metacontroller.github.io/metacontroller/guide/helm-install.html#configuration) docs for more examples.
<!--body:end-->
