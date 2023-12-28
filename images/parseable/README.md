<!--monopod:start-->
# parseable
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/parseable` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/parseable/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Parseable](https://github.com/parseablehq/parseable) is a lightweight, cloud native log observability engine. Parseable is written in Rust and uses Apache Arrow and Parquet as underlying data structures. Additionally, it uses a simple, index-free mechanism to organize and query data allowing low latency, and high throughput ingestion and query.

Parseable consumes up to ~80% lower memory and ~50% lower CPU than Elastic for similar ingestion throughput.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/parseable:latest
```
<!--getting:end-->

<!--body:start-->
## Using Parseable

This image should be a drop-in replacement for the upstream image, and works by default in the helm charts.

To install, follow the docs here: https://www.parseable.io/docs/category/installation  
you need to just override the image name from `parseable/parseable` to `cgr.dev/chainguard/parseable`.

For the helm chart, you can use the following:

```shell
$ helm repo add parseable https://charts.parseable.io
$ helm upgrade --install parseable parseable/parseable -n parseable --set parseable.image.repository=cgr.dev/chainguard/parseable --set parseable.image.tag=latest parseable/parseable
```


<!--body:end-->
