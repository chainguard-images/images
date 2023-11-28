<!--monopod:start-->
# envoy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/envoy` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/envoy/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Envoy](https://www.envoyproxy.io/) Cloud-native high-performance edge/middle/service proxy
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/envoy:latest
```
<!--getting:end-->

<!--body:start-->
## Using Envoy

To run with Docker using default configuration

```sh
docker run --platform=linux/amd64 -p10000:10000 -p 9901:9901 --rm cgr.dev/chainguard/envoy envoy --config-path /etc/envoy/envoy.yaml
```

Or to use a customised envoy configuratiom see https://www.envoyproxy.io/docs/envoy/latest/configuration/overview/overview and mount your file into the envoy container, e.g. `-v $PWD/config:/etc/envoy`

```sh
docker run --platform=linux/amd64 -p10000:10000 -p 9901:9901 --rm -v $PWD/config:/etc/envoy cgr.dev/chainguard/envoy envoy --config-path /etc/envoy/envoy.yaml
```
<!--body:end-->
