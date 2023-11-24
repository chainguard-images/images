<!--monopod:start-->
# vector
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/vector` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/vector/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

# Vector

Minimalist [wolfi](https://github.com/wolfi-dev)-based image of [Vector]
(https://github.com/vectordotdev/vector) for  high-performance,
end-to-end (agent & aggregator) observability data pipeline that puts you
 in control of your observability data.


## Get it!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vector:latest
```

## Usage

Project documentation provides official Helm chart for vector


To install the chart with the release name vector:

```
helm repo add vector https://helm.vector.dev
helm repo update

helm upgrade vector https://helm.vector.dev \
  --set image.repository=cgr.dev/chainguard/vector \
  --set image.tag=latest

```
