<!--monopod:start-->
# envoy-ratelimit
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/envoy-ratelimit` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/envoy-ratelimit/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
 Go/gRPC service designed to enable generic rate limit scenarios from different types of applications.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/envoy-ratelimit:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image should be a drop-in replacement for the upstream `envoyproxy/ratelimit` image.
See the [full documentation](https://gateway.envoyproxy.io/latest/user/rate-limit.html) for installation and usage.

See for the [examples](https://github.com/envoyproxy/ratelimit#examples).

This image includes `ratelimit`.
<!--body:end-->
