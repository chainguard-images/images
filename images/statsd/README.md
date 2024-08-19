<!--monopod:start-->
# statsd
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/statsd` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/statsd/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Daemon for easy but powerful stats aggregation
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/statsd:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

See the [statsd documentation](https://github.com/statsd/statsd?tab=readme-ov-file#usage) for more information on how to use statsd.

You can also use a Helm chart to install this image on a Kubernetes cluster:

```bash
helm repo add keyporttech https://keyporttech.github.io/helm-charts/
helm install my-release keyporttech/statsd \
  --namespace statsd \
  --create-namespace \
  --set image.repository="cgr.dev/chainguard/statsd" \
  --set image.tag="latest"
```
<!--body:end-->
