<!--monopod:start-->
# prometheus-cloudwatch-exporter
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-cloudwatch-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-cloudwatch-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the Prometheus Cloudwatch Exporter.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-cloudwatch-exporter
```

## Usage

The image is a drop-in replacement for the `prom/cloudwatch-exporter` image.

The image needs a configuration to run.
There is not an example included in the image, but you can find one [here](https://github.com/prometheus/cloudwatch_exporter/blob/master/example.yml).
The default location for the config is `/config/config.yml`, but this can be overridden with the image command.
