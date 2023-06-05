<!--monopod:start-->
# kubernetes-dashboard-metrics-scraper
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-dashboard-metrics-scraper` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubernetes-dashboard-metrics-scraper/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image that acts as a drop-in replacement for the `kubernetesui/metrics-scraper` image.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubernetes-dashboard-metrics-scraper:latest
```

You can run it with the standard deployment with something like:

```
helm install my-release kubernetes-dashboard/kubernetes-dashboard  \
  --set metricsScraper.image.repository=cgr.dev/chainguard/kubernetes-dashboard-metrics-scraper \
  --set metricsScraper.image.tag=latest \
  --set metricsScraper.enabled=true
```
