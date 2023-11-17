<!--monopod:start-->
# wavefront-proxy

<!--url:start-->
<a href="https://docs.wavefront.com/proxies.html">
<!--logo:start-->
  <img src="https://storage.googleapis.com/chainguard-academy/logos/wavefront-proxy/logo.svg" width="36px" height="36px" />
<!--logo:end-->
</a>
<!--url:end-->

| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/wavefront-proxy` |

* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wavefront-proxy/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*
---
<!--monopod:end-->

<!--overview:start-->
Minimal wavefront-proxy image
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wavefront-proxy:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image.

To test:

```shell
# Need to update WAVEFRONT_URL and WAVEFRONT_TOKEN accordingly

$ docker run -d \
 -e WAVEFRONT_URL=https://<myinstance>.wavefront.com/api \
 -e WAVEFRONT_TOKEN=<YOUR-API-TOKEN> \
 -e JAVA_HEAP_USAGE="1650m"\
 -m 2g \
 -p 2878:2878 \
  cgr.dev/chainguard/wavefront-proxy

```

Note that the `wavefront-proxy` does need the `WAVEFRONT_URL` and `WAVEFRONT_TOKEN`  to work correctly.
See the [configuration](https://docs.wavefront.com/proxies_kube_container.html) docs for more examples.
<!--body:end-->
