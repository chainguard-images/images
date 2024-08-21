<!--monopod:start-->
# envoy-ratelimit
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/envoy-ratelimit` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/envoy-ratelimit/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
 Go/gRPC service designed to enable generic rate limit scenarios from different types of applications.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/envoy-ratelimit:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

## Usage

This image should be a drop-in replacement for the upstream `envoyproxy/ratelimit` image.

The [`envoyproxy/ratelimit` GitHub repository](https://gateway.envoyproxy.io/latest/user/rate-limit.html) contains lots of useful information, as well as [several examples](https://github.com/envoyproxy/ratelimit#examples) showing how `ratelimit` works.

Additionally, the Envoy documentation has resources on [Global rate limiting](https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/other_features/global_rate_limiting) and [Local rate limiting](https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/other_features/local_rate_limiting).
<!--body:end-->
